require 'spec_helper'

describe Dnsimple::Client, ".registrar" do

  subject { described_class.new(base_url: "https://api.dnsimple.test", access_token: "a1b2c3").registrar }

  describe "#enable_autorenewal" do
    let(:account_id) { 1010 }
    let(:domain_id) { "example.com" }

    before do
      stub_request(:put, %r[/v2/#{account_id}/domains/#{domain_id}])
          .to_return(read_http_fixture("enableAutoRenewal/success.http"))
    end


    it "builds the correct request" do
      subject.enable_autorenewal(account_id, domain_id)

      expect(WebMock).to have_requested(:put, "https://api.dnsimple.test/v2/#{account_id}/domains/#{domain_id}/auto_renewal")
          .with(headers: { 'Accept' => 'application/json' })
    end

    it "returns nothing" do
      response = subject.enable_autorenewal(account_id, domain_id)
      expect(response).to be_a(Dnsimple::Response)

      result = response.data
      expect(result).to be_nil
    end

    context "when the domain does not exist" do
      it "raises NotFoundError" do
        stub_request(:put, %r[/v2])
            .to_return(read_http_fixture("notfound-domain.http"))

        expect {
          subject.enable_autorenewal(account_id, domain_id)
        }.to raise_error(Dnsimple::NotFoundError)
      end
    end
  end
  
end
