# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bubbler/version'

Gem::Specification.new do |spec|
  spec.name          = "bubbler"
  spec.version       = Bubbler::VERSION
  spec.authors       = ["Matias Keveri"]
  spec.email         = ["matias@keveri.fi"]
  spec.description   = %q{Creates HTML page with bubble charts of file sizes.
  Can also output raw html or json data.}
  spec.summary       = %q{Creates bubble charts.}
  spec.homepage      = "https://rubygems.org/gems/bubbler"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.1"
  spec.add_development_dependency "json", "~> 1.8"
  spec.add_development_dependency "slop", "~> 3.5"
  spec.add_development_dependency "mustache", "~> 0.99"
end
