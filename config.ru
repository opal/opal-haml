require 'bundler'
Bundler.require

require 'opal-sprockets'
require 'opal-rspec'

OPAL_SPROCKETS_SERVER = defined?(Opal::Sprockets::Server) ? Opal::Sprockets::Server : Opal::Server

sprockets_env = Opal::RSpec::SprocketsEnvironment.new(
  spec_pattern         = 'spec-opal/**/*_spec.{rb,opal}',
  spec_exclude_pattern = nil,
  spec_files           = nil,
  default_path         = 'spec-opal')

run OPAL_SPROCKETS_SERVER.new(sprockets: sprockets_env) { |s|
  s.main = 'opal/rspec/sprockets_runner'
  s.append_path 'spec-opal'
  s.debug = true
}
