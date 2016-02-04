module Dnsimple
  module Struct

    class Base
      def initialize(attributes = {})
        attributes.each do |key, value|
          m = "#{key}=".to_sym
          self.send(m, value) if self.respond_to?(m)
        end
      end
    end

  end
end

require_relative 'struct/account'
require_relative 'struct/contact'
require_relative 'struct/domain'
require_relative 'struct/email_forward'
require_relative 'struct/record'
require_relative 'struct/user'
require_relative 'struct/zone'
