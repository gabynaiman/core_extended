# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'core_extended/version'

Gem::Specification.new do |spec|
  spec.name          = 'core_extended'
  spec.version       = CoreExtended::VERSION
  spec.authors       = ['Gabriel Naiman']
  spec.email         = ['gabynaiman@gmail.com']
  spec.description   = 'Ruby core extensions'
  spec.summary       = 'Ruby core extensions'
  spec.homepage      = 'https://github.com/gabynaiman/core_extended'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest', '~> 4.7'
  spec.add_development_dependency 'minitest-great_expectations'
  spec.add_development_dependency 'turn', '~> 0.9'
  spec.add_development_dependency 'simplecov'
end
