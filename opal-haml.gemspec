# -*- encoding: utf-8 -*-
$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'opal/haml/version'

Gem::Specification.new do |s|
  s.name         = 'opal-haml'
  s.version      = Opal::Haml::VERSION
  s.author       = 'Adam Beynon'
  s.email        = 'adam@adambeynon.com'
  s.homepage     = 'http://opalrb.org'
  s.summary      = 'Run Haml templates client-side with Opal'
  s.description  = 'Run Haml templates client-side with Opal.'
  s.license      = 'MIT'

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']

  s.add_dependency 'opal', '~> 0.10.0'
  s.add_dependency 'haml'

  s.add_development_dependency 'opal-rspec', '~> 0.6.0'
  s.add_development_dependency 'rake'
end
