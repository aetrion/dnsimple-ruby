module Dnsimple
  module Struct

    class Base
      def initialize(attributes = {})
        attributes.each do |key, value|
          m = "#{key}=".to_sym
          send(m, value) if respond_to?(m)
        end
      end
    end

  end
end

require_relative 'struct/account'
require_relative 'struct/contact'
require_relative 'struct/domain'
require_relative 'struct/domain_check'
require_relative 'struct/email_forward'
require_relative 'struct/extended_attribute'
require_relative 'struct/oauth_token'
require_relative 'struct/zone_record'
require_relative 'struct/service'
require_relative 'struct/template'
require_relative 'struct/template_record'
require_relative 'struct/tld'
require_relative 'struct/user'
require_relative 'struct/whois_privacy'
require_relative 'struct/zone'
require_relative 'struct/webhook'
require_relative 'struct/whoami'
