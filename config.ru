require 'bundler'
Bundler.require

require 'opal-sprockets'
require 'opal-rspec'

OPAL_SPROCKETS_SERVER = defined?(Opal::Server) ? Opal::Server : Opal::Sprockets::Server

run OPAL_SPROCKETS_SERVER.new { |s|
  s.main = 'opal/rspec/sprockets_runner'
  s.append_path 'spec'
  s.debug = true
}
