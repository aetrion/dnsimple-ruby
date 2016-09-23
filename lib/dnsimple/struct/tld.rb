module Dnsimple
  module Struct

    class Tld < Base
      # @return [String] The TLD in DNSimple.
      attr_accessor :tld

      # @return [Fixnum] The TLD type.
      attr_accessor :tld_type

      # @return [Boolean] True if Whois Privacy Protection is available.
      attr_accessor :whois_privacy

      # @return [Boolean] True if TLD requires use of auto-renewal for renewals.
      attr_accessor :auto_renew_only

      # @return [Boolean] True if IDN is available.
      attr_accessor :idn

      # @return [Fixnum] The minimum registration period, in years.
      attr_accessor :minimum_registration

      # @return [Boolean] True if it allows to register a domain.
      attr_accessor :registration_enabled

      # @return [Boolean] True if it allows to renew a domain.
      attr_accessor :renewal_enabled

      # @return [Boolean] True if it allows to transfer a domain.
      attr_accessor :transfer_enabled
    end

  end
end
