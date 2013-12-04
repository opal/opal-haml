require 'haml'
require 'opal-sprockets'

module Opal
  module Haml
    class Processor < Tilt::Template
      self.default_mime_type = 'application/javascript'

      def self.engine_initialized?
        true
      end

      def initialize_engine
        require_template_library 'opal'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        Opal::Haml.compile data, scope.logical_path.sub(/^templates\//, '')
      end
    end
  end
end

Sprockets.register_engine '.haml',  Opal::Haml::Processor
