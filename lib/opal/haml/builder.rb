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
        ::Opal::Haml.compile_haml(source, path)
      end
    end
  end
end
