require 'cgi'
require 'rubygems'
require 'bundler'

Bundler.require :default, :development

VCR.config do |c|
  c.cassette_library_dir = 'fixtures/vcr_cassettes'
  c.stub_with :fakeweb
  c.filter_sensitive_data("<USERNAME>") { CGI::escape(DNSimple::Client.username) }
  c.filter_sensitive_data("<PASSWORD>") { CGI::escape(DNSimple::Client.password) }
end

RSpec.configure do |c|
  c.mock_framework = :mocha
  c.extend VCR::RSpec::Macros
end

config = YAML.load(File.new(File.expand_path('~/.dnsimple.local')))

DNSimple::Client.base_uri = config['site'] || "https://test.dnsimple.com/" 
DNSimple::Client.username = config['username']
DNSimple::Client.password = config['password'] 
