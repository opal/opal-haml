require 'haml'
require 'sprockets'

module Opal
  module Haml
    class Processor < ::Opal::Processor
      self.default_mime_type = 'application/javascript'

      def evaluate(context, locals, &block)
        @data = Opal::Haml.compile_haml @data, context.logical_path.sub(/^templates\//, '')
        super
      end

      def self.compiler_options
        # otherwise would check current class `attr_accessor`s
        ::Opal::Processor.compiler_options
      end
    end
  end
end

if Sprockets.respond_to? :register_transformer
  extra_args = [{mime_type: 'application/javascript', silence_deprecation: true}]
else
  extra_args = []
end

Sprockets.register_engine '.haml', Opal::Haml::Processor, *extra_args
