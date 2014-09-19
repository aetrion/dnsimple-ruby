require 'spec_helper'

describe DNSimple::Client do

  let(:klass) { described_class }
  let(:response) { stub('response', :code => 200) }

  before do
    @_username  = described_class.username
    @_password  = described_class.password
    @_api_token = described_class.api_token
    @_base_uri  = described_class.base_uri
  end

  after do
    described_class.username   = @_username
    described_class.password   = @_password
    described_class.api_token  = @_api_token
    described_class.base_uri   = @_base_uri
  end

  [:get, :post, :put, :delete].each do |method|
    describe ".#{method}" do
      it "delegates to .request" do
        described_class.expects(:request).with(method, '/domains', { :foo => 'bar' })
        described_class.send(method, '/domains', { :foo => 'bar' })
      end
    end
  end

  describe ".request" do
    it "uses HTTP authentication if there's a password provided" do
      described_class.username   = 'user'
      described_class.password   = 'pass'
      described_class.api_token  = nil
      described_class.domain_token  = nil
      described_class.base_uri   = 'https://api.example.com/'

      HTTParty.expects(:get).
        with('https://api.example.com/domains', has_entries(:basic_auth => { :username => 'user', :password => 'pass' })).
        returns(response)

      described_class.request(:get, '/domains', {})
    end

    it "uses header authentication if there's an api token provided" do
      described_class.username   = 'user'
      described_class.password   = nil
      described_class.api_token  = 'token'
      described_class.domain_token  = nil
      described_class.base_uri   = 'https://api.example.com/'

      HTTParty.expects(:get).
        with('https://api.example.com/domains', has_entries(:headers => has_entries({ 'X-DNSimple-Token' => 'user:token' }))).
        returns(response)

      described_class.request(:get, '/domains', {})
    end

    it "uses domain header authentication if it is provided" do 
      described_class.username   = nil
      described_class.password   = nil
      described_class.api_token  = nil
      described_class.domain_token  = 'token'
      described_class.base_uri   = 'https://api.example.com/'

      HTTParty.expects(:get).
        with('https://api.example.com/domains', has_entries(:headers => has_entries({ 'X-DNSimple-Domain-Token' => 'token' }))).
        returns(response)

      described_class.request(:get, '/domains', {})
    end

    it "raises an error if there's no password or api token provided" do
      described_class.username   = 'user'
      described_class.password   = nil
      described_class.api_token  = nil
      described_class.domain_token  = nil
      described_class.base_uri   = 'https://api.example.com/'

      expect {
        described_class.request(:get, '/domains', {})
      }.to raise_error(DNSimple::Error, 'A password or API token is required for all API requests.')
    end

    it "adds a custom user-agent" do
      HTTParty.expects(:get).
        with(is_a(String), has_entries(:headers => has_entries({ 'User-Agent' => "dnsimple-ruby/#{DNSimple::VERSION}" }))).
        returns(response)

      described_class.request(:get, '/foo', {})
    end

    it "performs a request" do
      HTTParty.expects(:get).
        with("#{described_class.base_uri}/foo",
          :format => :json,
          :basic_auth => { :username => described_class.username, :password => described_class.password },
          :headers => { 'Accept' => 'application/json', 'User-Agent' => "dnsimple-ruby/#{DNSimple::VERSION}" }
          ).
        returns(response)

      described_class.request(:get, '/foo', {})
    end
  end


  describe ".base_uri" do
    it "returns the qualified API uri" do
      klass.base_uri = "http://api.dnsimple.com"
      expect(klass.base_uri).to eq("http://api.dnsimple.com")
    end
  end

  describe ".base_uri=" do
    it "sets the base_uri" do
      klass.base_uri = "http://api1.dnsimple.com/"
      expect(klass.base_uri).to eq("http://api1.dnsimple.com")
      klass.base_uri = "http://api2.dnsimple.com"
      expect(klass.base_uri).to eq("http://api2.dnsimple.com")
    end
  end

end
