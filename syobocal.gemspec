# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'syobocal/version'

Gem::Specification.new do |spec|
  spec.name          = "syobocal"
  spec.version       = Syobocal::VERSION
  spec.authors       = ["na-o-sss"]
  spec.email         = ["nao"]
  spec.summary       = %q{Syobocal API Wrapper}
  spec.description   = %q{The Wrapper for Syoboi calendar API to get their anime information.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "nokogiri"
end
