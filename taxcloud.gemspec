# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taxcloud/version'
require 'vcr'
require 'minitest/spec'
require 'test/unit'

Gem::Specification.new do |spec|
  spec.name          = 'TaxCloud'
  spec.version       = TaxCloud::VERSION
  spec.authors       = ['Dave Onnen']
  spec.email         = ['donnen@fed-tax.net']
  spec.summary       = 'TaxCloud free sales tax calculation gem'
  spec.description   = 'This gem allows you to easily integration your Ruby application with the TaxCloud web services'
  spec.homepage      = 'http://rubygems.org/gems/taxcloud'
  spec.license       = 'https://taxcloud.net/ftpsl.pdf'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'faraday'
  spec.add_dependency 'vcr'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
end
