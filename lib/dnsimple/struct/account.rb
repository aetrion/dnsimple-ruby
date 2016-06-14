module Dnsimple
  module Struct

    class Account < Base
      # @return [Fixnum] The account ID in DNSimple.
      attr_accessor :id

      # @return [String] The account email.
      attr_accessor :email

      # @return [String] The identifier of the plan the account is subscribed to.
      attr_accessor :plan_identifier
    end

  end
end
