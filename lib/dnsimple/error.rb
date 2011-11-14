module DNSimple
  class Error < StandardError
    def initialize(message)
      super(message)
    end
  end

  class DomainError < DNSimple::Error
    def initialize(domain, messages)
      @domain = domain
      @messages = messages
      super "An error occurred: #{messages}"
    end
  end

  class RecordExists < DomainError; end

  class AuthenticationFailed < DNSimple::Error; end

  class UserNotFound < DNSimple::Error; end

  class CertificateExists < DNSimple::Error; end

  class CertificateNotFound < DNSimple::Error; end
end
