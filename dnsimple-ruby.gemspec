# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "sparqcode-dnsimple-ruby"
  s.version = "1.2.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Anthony Eden"]
  s.date = "2012-03-02"
  s.description = "A ruby wrapper for the DNSimple API that also includes a command-line client.  This gem is identical to the offical one, except we added support for setting name servers."
  s.email = "anthony.eden@dnsimple.com"
  s.executables = ["dnsimple"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README",
    "README.rdoc",
    "README.textile"
  ]
  s.files = [
    ".bundle/config",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE",
    "README",
    "README.rdoc",
    "README.textile",
    "Rakefile",
    "VERSION",
    "bin/dnsimple",
    "bin/dnsimple.rb",
    "dnsimple-ruby.gemspec",
    "features/README",
    "features/cli/certificates/purchase_certificate.feature",
    "features/cli/contacts/create_contact.feature",
    "features/cli/domains/check_domain.feature",
    "features/cli/domains/create_domain.feature",
    "features/cli/domains/delete_domain.feature",
    "features/cli/domains/register_domain.feature",
    "features/cli/records/create_ptr_record.feature",
    "features/cli/records/create_record.feature",
    "features/cli/records/delete_record.feature",
    "features/cli/templates/apply_template.feature",
    "features/step_definitions/certificate_steps.rb",
    "features/step_definitions/cli_steps.rb",
    "features/step_definitions/domain_steps.rb",
    "features/step_definitions/record_steps.rb",
    "features/step_definitions/template_steps.rb",
    "features/support/env.rb",
    "fixtures/vcr_cassettes/DNSimple_Certificate/_all.yml",
    "fixtures/vcr_cassettes/DNSimple_Certificate/_purchase.yml",
    "fixtures/vcr_cassettes/DNSimple_Certificate/_submit.yml",
    "fixtures/vcr_cassettes/DNSimple_Contact/a_new_contact.yml",
    "fixtures/vcr_cassettes/DNSimple_Contact/an_existing_contact.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/_all.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/applying_templates.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/creating_a_new_domain.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/finding_an_existing_domain/by_id.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/finding_an_existing_domain/by_name.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/registration/with_a_new_registrant_contact.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/registration/with_an_existing_contact.yml",
    "fixtures/vcr_cassettes/DNSimple_Domain/setting_name_servers.yml",
    "fixtures/vcr_cassettes/DNSimple_ExtendedAttribute/list_extended_attributes/for_ca.yml",
    "fixtures/vcr_cassettes/DNSimple_ExtendedAttribute/list_extended_attributes/for_com.yml",
    "fixtures/vcr_cassettes/DNSimple_Record/_all.yml",
    "fixtures/vcr_cassettes/DNSimple_Record/creating_a_new_record.yml",
    "fixtures/vcr_cassettes/DNSimple_Record/find_a_record.yml",
    "fixtures/vcr_cassettes/DNSimple_Template/a_template.yml",
    "fixtures/vcr_cassettes/DNSimple_User/_me.yml",
    "lib/dnsimple.rb",
    "lib/dnsimple/certificate.rb",
    "lib/dnsimple/cli.rb",
    "lib/dnsimple/client.rb",
    "lib/dnsimple/command.rb",
    "lib/dnsimple/commands/add_service.rb",
    "lib/dnsimple/commands/add_template_record.rb",
    "lib/dnsimple/commands/apply_template.rb",
    "lib/dnsimple/commands/check_domain.rb",
    "lib/dnsimple/commands/clear_domain.rb",
    "lib/dnsimple/commands/create_contact.rb",
    "lib/dnsimple/commands/create_domain.rb",
    "lib/dnsimple/commands/create_record.rb",
    "lib/dnsimple/commands/create_template.rb",
    "lib/dnsimple/commands/delete_contact.rb",
    "lib/dnsimple/commands/delete_domain.rb",
    "lib/dnsimple/commands/delete_record.rb",
    "lib/dnsimple/commands/delete_template.rb",
    "lib/dnsimple/commands/delete_template_record.rb",
    "lib/dnsimple/commands/describe_certificate.rb",
    "lib/dnsimple/commands/describe_contact.rb",
    "lib/dnsimple/commands/describe_domain.rb",
    "lib/dnsimple/commands/describe_record.rb",
    "lib/dnsimple/commands/describe_service.rb",
    "lib/dnsimple/commands/describe_user.rb",
    "lib/dnsimple/commands/list_applied_services.rb",
    "lib/dnsimple/commands/list_available_services.rb",
    "lib/dnsimple/commands/list_certificates.rb",
    "lib/dnsimple/commands/list_contacts.rb",
    "lib/dnsimple/commands/list_domains.rb",
    "lib/dnsimple/commands/list_extended_attributes.rb",
    "lib/dnsimple/commands/list_records.rb",
    "lib/dnsimple/commands/list_services.rb",
    "lib/dnsimple/commands/list_template_records.rb",
    "lib/dnsimple/commands/list_templates.rb",
    "lib/dnsimple/commands/purchase_certificate.rb",
    "lib/dnsimple/commands/register_domain.rb",
    "lib/dnsimple/commands/remove_service.rb",
    "lib/dnsimple/commands/submit_certificate.rb",
    "lib/dnsimple/commands/transfer_domain.rb",
    "lib/dnsimple/commands/update_contact.rb",
    "lib/dnsimple/commands/update_record.rb",
    "lib/dnsimple/contact.rb",
    "lib/dnsimple/domain.rb",
    "lib/dnsimple/error.rb",
    "lib/dnsimple/extended_attribute.rb",
    "lib/dnsimple/record.rb",
    "lib/dnsimple/service.rb",
    "lib/dnsimple/template.rb",
    "lib/dnsimple/template_record.rb",
    "lib/dnsimple/transfer_order.rb",
    "lib/dnsimple/user.rb",
    "spec/README",
    "spec/certificate_spec.rb",
    "spec/command_spec.rb",
    "spec/commands/add_service_spec.rb",
    "spec/commands/create_record_spec.rb",
    "spec/commands/list_records_spec.rb",
    "spec/commands/purchase_certificate_spec.rb",
    "spec/commands/submit_certificate_spec.rb",
    "spec/contact_spec.rb",
    "spec/domain_spec.rb",
    "spec/extended_attributes_spec.rb",
    "spec/record_spec.rb",
    "spec/spec_helper.rb",
    "spec/template_spec.rb",
    "spec/user_spec.rb"
  ]
  s.homepage = "http://github.com/SPARQCode/dnsimple-ruby"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.15"
  s.summary = "A ruby wrapper for the DNSimple API."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
      s.add_development_dependency(%q<aruba>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
      s.add_development_dependency(%q<vcr>, [">= 0"])
      s.add_runtime_dependency(%q<httparty>, [">= 0"])
    else
      s.add_dependency(%q<httparty>, [">= 0"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 2.0.0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
      s.add_dependency(%q<aruba>, [">= 0"])
      s.add_dependency(%q<ruby-debug>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
      s.add_dependency(%q<vcr>, [">= 0"])
      s.add_dependency(%q<httparty>, [">= 0"])
    end
  else
    s.add_dependency(%q<httparty>, [">= 0"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 2.0.0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
    s.add_dependency(%q<aruba>, [">= 0"])
    s.add_dependency(%q<ruby-debug>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
    s.add_dependency(%q<vcr>, [">= 0"])
    s.add_dependency(%q<httparty>, [">= 0"])
  end
end

