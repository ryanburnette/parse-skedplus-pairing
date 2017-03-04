# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "skedplus_pairing/version"

Gem::Specification.new do |spec|
  spec.name          = "skedplus_pairing"
  spec.version       = SkedplusPairing::VERSION
  spec.authors       = ["Ryan Burnette"]
  spec.email         = ["ryan.burnette@gmail.com"]

  spec.summary       = ""
  spec.homepage      = "https://github.com/ryanburnette/skedplus_pairing"

  #spec.files         = `git ls-files -z`.split("\x0").reject do |f|
  #  f.match(%r{^(test|spec|features)/})
  #end
  #spec.require_paths = ["lib"]

	spec.add_dependency "pikelet", "~> 2.0.0"
	spec.add_dependency "ruby-duration", "~> 3.2.3"
  spec.add_dependency "retriable"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard-rspec", "~> 4.7.0"
end
