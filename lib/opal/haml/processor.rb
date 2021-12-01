require 'haml'
require 'opal-sprockets'

module Opal
  module Haml
    class Processor < ::Opal::Sprockets::Processor
      def call
        @data = Opal::Haml.compile_haml @data, context.logical_path.sub(/#{Opal::REGEXP_START}templates\//, '')
        super
      end
    end
  end
end

Sprockets.register_mime_type 'application/html+haml', extensions: ['.haml', '.html.haml']
Sprockets.register_transformer 'application/html+haml', 'application/javascript', Opal::Haml::Processor
Opal::Sprockets.register_mime_type 'application/html+haml'
