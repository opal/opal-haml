require 'opal'
require 'opal/haml/builder'
require 'opal/haml/processor'
require 'opal/haml/version'

module Opal
  module Haml
    haml_major_version = ::Haml::VERSION.to_i
    @options = if haml_major_version > 4
      {freeze_static: false, remove_whitespace: true}
    else
      {freeze_static: false, remove_whitespace: true, ugly: true}
    end.freeze

    def self.compile(source, file = '(haml)')
      Opal.compile(compile_haml(source, file))
    end

    def self.compile_haml(source, file)
      haml = ::Haml::Engine.new(source, @options).precompiled
      haml = haml.gsub('_hamlout.buffer', '_hamlout')
      wrap(haml, file)
    end

    def self.wrap(haml, file)
      <<-EOS
        require 'opal-haml'
        Template.new('#{file}') do |_hamlout|
          _hamlout.extend Haml::Buffer
          #{haml}
          _hamlout.join
        end
      EOS
    end
  end
end

Opal.append_path File.expand_path('../../../opal', __FILE__).untaint
