# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{geokit-rails}
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Andre Lewis", "Bill Eisenhauer"]
  s.date = %q{2010-09-08}
  s.description = %q{}
  s.email = ["andre@earthcode.com", "bill@billeisenhauer.com"]
  s.extra_rdoc_files = ["Manifest.txt"]
  s.files = ["CHANGELOG.rdoc", "MIT-LICENSE", "Manifest.txt", "README.markdown", "Rakefile", "about.yml", "assets/api_keys_template", "geokit-rails.gemspec", "init.rb", "install.rb", "lib/geokit-rails.rb", "lib/geokit-rails/acts_as_mappable.rb", "lib/geokit-rails/adapters/abstract.rb", "lib/geokit-rails/adapters/mysql.rb", "lib/geokit-rails/adapters/postgresql.rb", "lib/geokit-rails/adapters/sqlserver.rb", "lib/geokit-rails/defaults.rb", "lib/geokit-rails/geocoder_control.rb", "lib/geokit-rails/ip_geocode_lookup.rb", "test/acts_as_mappable_test.rb", "test/boot.rb", "test/database.yml", "test/fixtures/companies.yml", "test/fixtures/custom_locations.yml", "test/fixtures/locations.yml", "test/fixtures/mock_addresses.yml", "test/fixtures/mock_families.yml", "test/fixtures/mock_houses.yml", "test/fixtures/mock_organizations.yml", "test/fixtures/mock_people.yml", "test/fixtures/stores.yml", "test/ip_geocode_lookup_test.rb", "test/models/company.rb", "test/models/custom_location.rb", "test/models/location.rb", "test/models/mock_address.rb", "test/models/mock_family.rb", "test/models/mock_house.rb", "test/models/mock_organization.rb", "test/models/mock_person.rb", "test/models/store.rb", "test/schema.rb", "test/tasks.rake", "test/test_helper.rb"]
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{geokit-rails}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Geo distance calculations, distance calculation query support, geocoding for physical and ip addresses.}
  s.test_files = ["test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<geokit>, [">= 1.5.0"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.2"])
    else
      s.add_dependency(%q<geokit>, [">= 1.5.0"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.6.2"])
    end
  else
    s.add_dependency(%q<geokit>, [">= 1.5.0"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.6.2"])
  end
end
