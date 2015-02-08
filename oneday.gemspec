# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'oneday/version'

Gem::Specification.new do |spec|
  spec.name          = "oneday"
  spec.version       = Oneday::VERSION
  spec.authors       = ["Jan Lindblom"]
  spec.email         = ["janlindblom@fastmail.fm"]
  spec.summary       = %q{Journaling on the command line.}
  spec.description   = %q{Journaling on the command line, inspired by jrnl.}
  spec.homepage      = "https://github.com/janlindblom/oneday"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'rspec', '~> 3.2.0'
  spec.add_dependency 'nokogiri', '~> 1.6'
  spec.add_dependency 'parseconfig', '~> 1.0.6'
end
