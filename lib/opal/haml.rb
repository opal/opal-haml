require 'opal'
require 'opal/haml/processor'
require 'opal/haml/version'

module Opal
  module Haml
    def self.compile(source, file = '(haml)')
      haml = ::Haml::Engine.new(source, :ugly => true).precompiled
      Opal.compile(wrap(haml, file))
    end

    def self.wrap(haml, file)
      "Template.new('#{file}') do |_hamlout|\n#{haml}\n_hamlout.join\nend\n"
    end
  end
end

Opal.append_path File.expand_path('../../../opal', __FILE__).untaint
