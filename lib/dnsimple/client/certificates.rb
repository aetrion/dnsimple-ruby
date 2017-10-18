module Dnsimple
  class Client
    module Certificates

      # Lists the certificates associated to the domain.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#list
      # @see #all_certificates
      #
      # @example List certificates in the first page
      #   client.certificates.list(1010, "example.com")
      #
      # @example List certificates, provide a specific page
      #   client.certificates.list(1010, "example.com", page: 2)
      #
      # @example List certificates, provide a sorting policy
      #   client.certificates.list(1010, "example.com", sort: "email:asc")
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_name the domain name
      # @param  [Hash] options the filtering and sorting options
      # @option options [Integer] :page current page (pagination)
      # @option options [Integer] :per_page number of entries to return (pagination)
      # @return [Dnsimple::PaginatedResponse<Dnsimple::Struct::Certificate>]
      #
      # @raise  [Dnsimple::RequestError]
      def certificates(account_id, domain_name, options = {})
        response = client.get(Client.versioned("/%s/domains/%s/certificates" % [account_id, domain_name]), Options::ListOptions.new(options))

        Dnsimple::PaginatedResponse.new(response, response["data"].map { |r| Struct::Certificate.new(r) })
      end

      # Lists ALL the certificates for the domain.
      #
      # This method is similar to {#certificates}, but instead of returning the results of a specific page
      # it iterates all the pages and returns the entire collection.
      #
      # Please use this method carefully, as fetching the entire collection will increase the number of requests
      # you send to the API server and you may eventually risk to hit the throttle limit.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#list
      # @see #certificates
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_name The domain ID or domain name
      # @param  [Hash] options the filtering and sorting option
      # @option options [Integer] :page current page (pagination)
      # @option options [Integer] :per_page number of entries to return (pagination)
      # @option options [String] :sort sorting policy
      # @return [Dnsimple::CollectionResponse<Dnsimple::Struct::Certificate>]
      #
      # @raise  [Dnsimple::RequestError]
      def all_certificates(account_id, domain_name, options = {})
        paginate(:certificates, account_id, domain_name, options)
      end

      # Gets a certificate associated to the domain.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#get
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_id the domain ID or domain name
      # @param  [Integer] certificate_id the certificate ID
      # @param  [Hash] options
      # @return [Dnsimple::Response<Dnsimple::Struct::Certificate>]
      #
      # @raise  [Dnsimple::NotFoundError]
      # @raise  [Dnsimple::RequestError]
      def certificate(account_id, domain_id, certificate_id, options = {})
        response = client.get(Client.versioned("/%s/domains/%s/certificates/%s" % [account_id, domain_id, certificate_id]), options)

        Dnsimple::Response.new(response, Struct::Certificate.new(response["data"]))
      end

      # Downloads a certificate associated to the domain.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#download
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_id the domain ID or domain name
      # @param  [Integer] certificate_id the certificate ID
      # @param  [Hash] options
      # @return [Dnsimple::Response<Dnsimple::Struct::CertificateBundle>]
      #
      # @raise  [Dnsimple::NotFoundError]
      # @raise  [Dnsimple::RequestError]
      def download_certificate(account_id, domain_id, certificate_id, options = {})
        response = client.get(Client.versioned("/%s/domains/%s/certificates/%s/download" % [account_id, domain_id, certificate_id]), options)

        Dnsimple::Response.new(response, Struct::CertificateBundle.new(response["data"]))
      end

      # Get certificate private key associated to the domain.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#get-private-key
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_id the domain ID or domain name
      # @param  [Integer] certificate_id the certificate ID
      # @param  [Hash] options
      # @return [Dnsimple::Response<Dnsimple::Struct::CertificateBundle>]
      #
      # @raise  [Dnsimple::NotFoundError]
      # @raise  [Dnsimple::RequestError]
      def certificate_private_key(account_id, domain_id, certificate_id, options = {})
        response = client.get(Client.versioned("/%s/domains/%s/certificates/%s/private_key" % [account_id, domain_id, certificate_id]), options)

        Dnsimple::Response.new(response, Struct::CertificateBundle.new(response["data"]))
      end

      # Purchase a Let's Encrypt certificate.
      #
      # @see https://developer.dnsimple.com/v2/domains/certificates/#letsencrypt-purchase
      #
      # @param  [Integer] account_id the account ID
      # @param  [#to_s] domain_id the domain ID or domain name
      # @param  [Hash] attributes
      # @option attributes [Integer] :contact_id the contact ID (mandatory)
      # @option attributes [String] :name the certificate name (optional)
      # @option attributes [Array<String>] :alternate_names the certificate alternate names (optional)
      # @option attributes [TrueClass,FalseClass] :auto_renew enable certificate auto renew (optional)
      #
      # @return [Dnsimple::Response<Dnsimple::Struct::Certificate>]
      #
      # @raise  [Dnsimple::NotFoundError]
      # @raise  [Dnsimple::RequestError]
      #
      # @example Basic usage
      #   reponse     = client.certificates.letsencrypt_purchase(1010, "example.com", contact_id: 1)
      #   certificate = response.data
      #
      #   certificate.id              # => 100
      #   certificate.name            # => "www"
      #   certificate.common_name     # => "www.example.com"
      #   certificate.alternate_names # => []
      #   certificate.auto_renew      # => false
      #
      # @example Custom name
      #   reponse     = client.certificates.letsencrypt_purchase(1010, "example.com", contact_id: 1, name: "docs")
      #   certificate = response.data
      #
      #   certificate.id              # => 100
      #   certificate.name            # => "docs"
      #   certificate.common_name     # => "docs.example.com"
      #   certificate.alternate_names # => []
      #   certificate.auto_renew      # => false
      #
      # @example Alternamte names
      #   reponse     = client.certificates.letsencrypt_purchase(1010, "example.com", contact_id: 1, alternate_names: ["api.example.com", "status.example.com"])
      #   certificate = response.data
      #
      #   certificate.id              # => 100
      #   certificate.name            # => "www"
      #   certificate.common_name     # => "www.example.com"
      #   certificate.alternate_names # => ["api.example.com", "status.example.com"]
      #   certificate.auto_renew      # => false
      #
      # @example Auto renew
      #   reponse     = client.certificates.letsencrypt_purchase(1010, "example.com", contact_id: 1, auto_renew: true)
      #   certificate = response.data
      #
      #   certificate.id              # => 100
      #   certificate.name            # => "www"
      #   certificate.common_name     # => "www.example.com"
      #   certificate.alternate_names # => []
      #   certificate.auto_renew      # => true
      def letsencrypt_purchase(account_id, domain_id, attributes, options = {})
        Extra.validate_mandatory_attributes(attributes, [:contact_id])
        response = client.post(Client.versioned("/%s/domains/%s/certificates/letsencrypt" % [account_id, domain_id]), attributes, options)

        Dnsimple::Response.new(response, Struct::Certificate.new(response["data"]))
      end

    end
  end
end
