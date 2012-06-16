require 'rubygems'
require 'bundler'

Bundler.require :default, :development

require 'aruba/cucumber'

Before do
  @aruba_timeout_seconds = 30
  ENV['DNSIMPLE_CONFIG'] = '~/.dnsimple.test'
end

After do |scenario|
  unless ENV['NODELETE'] || scenario.source_tag_names.include?('@skip-delete')
    if @domain_name && (@domain_name =~ /^cli-/ || @domain_name =~ /in-addr\.arpa/)
      steps %Q(When I run `dnsimple delete #{@domain_name}`)
    end
  end
end
