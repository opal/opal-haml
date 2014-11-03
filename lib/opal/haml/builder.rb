require 'opal/builder_processors'

module Opal
  module Haml
    class HamlProcessor < Opal::BuilderProcessors::RubyProcessor
      handles :haml

      def initialize(*args)
        super
        @source = prepare(@source, @filename)
      end

      def requires
        ['opal-haml'] + super
      end

      def prepare(source, path)
        haml = ::Haml::Engine.new(source, :ugly => true).precompiled
        haml = haml.gsub('_hamlout.buffer', '_hamlout')

        ::Opal::Haml.wrap haml, path
      end
    end
  end
end
