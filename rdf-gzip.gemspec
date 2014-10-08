# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdf/gzip/version'

Gem::Specification.new do |spec|
  spec.name          = "rdf-gzip"
  spec.version       = Rdf::Gzip::VERSION
  spec.authors       = ["Ross Singer"]
  spec.email         = ["rossfsinger@gmail.com"]
  spec.summary       = %q{gzip support for rdf.rb readers and writers}
  spec.description   = ""
  spec.homepage      = ""
  spec.license       = ""

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_dependency "rdf"
end