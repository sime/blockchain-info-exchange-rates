# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: blockchain-info-exchange-rates 0.2.1 ruby lib

Gem::Specification.new do |s|
  s.name = "blockchain-info-exchange-rates"
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Simon Males"]
  s.date = "2015-02-11"
  s.description = "This is a direct rip/port of Money Open Exchange Rates experimental and not used in production."
  s.email = "sime@sime.net.au"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "blockchain-info-exchange-rates.gemspec",
    "lib/money/bank/blockchain_info_exchange_rates.rb",
    "test/helper.rb",
    "test/latest.json",
    "test/test_blockchain-info-exchange-rates.rb"
  ]
  s.homepage = "http://github.com/sime/blockchain-info-exchange-rates"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5"
  s.summary = "Money Blockchain.info Exchange Rates"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<monetize>, ["~> 1.1.0"])
      s.add_runtime_dependency(%q<json>, [">= 1.7"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<minitest>, [">= 2.0"])
      s.add_development_dependency(%q<pry>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 1.0.4"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<timecop>, [">= 0"])
      s.add_development_dependency(%q<fakeweb>, [">= 0"])
    else
      s.add_dependency(%q<monetize>, ["~> 1.1.0"])
      s.add_dependency(%q<json>, [">= 1.7"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<rdoc>, ["~> 3.12"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<minitest>, [">= 2.0"])
      s.add_dependency(%q<pry>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 1.0.4"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<timecop>, [">= 0"])
      s.add_dependency(%q<fakeweb>, [">= 0"])
    end
  else
    s.add_dependency(%q<monetize>, ["~> 1.1.0"])
    s.add_dependency(%q<json>, [">= 1.7"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<rdoc>, ["~> 3.12"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<minitest>, [">= 2.0"])
    s.add_dependency(%q<pry>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 1.0.4"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<timecop>, [">= 0"])
    s.add_dependency(%q<fakeweb>, [">= 0"])
  end
end

