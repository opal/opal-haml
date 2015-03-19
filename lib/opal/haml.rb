require 'opal'
require 'opal/haml/builder'
require 'opal/haml/processor'
require 'opal/haml/version'

module Opal
  module Haml
    def self.compile(source, file = '(haml)')
      Opal.compile(compile_haml(source, file))
    end

    def self.compile_haml(source, file)
      haml = ::Haml::Engine.new(source, :ugly => true).precompiled
      haml = haml.gsub('_hamlout.buffer', '_hamlout')
      wrap(haml, file)
    end

    def self.wrap(haml, file)
      <<-EOS
        require 'opal-haml'
        Template.new('#{file}') do |_hamlout|
          #{haml}
          _hamlout.join
        end
      EOS
    end
  end
end

Opal.append_path File.expand_path('../../../opal', __FILE__).untaint
