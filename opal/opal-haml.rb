require 'template'

class Template
  class OutputBuffer
    alias << append

    # allow tags in haml to have dynamic attributes
    def attributes(class_id, obj_ref, *attributes_hashes)
      attributes = class_id

      attributes_hashes.each do |hash|
        attributes.update hash
      end

      result = []
      _render_attributes attributes, result, ''

      result.join
    end

    private

    def _render_attributes(attributes, out, prefix)
      attributes.each do |attr, value|
        case value
        when true then out << " #{prefix}#{attr}"
        when false then next
        when Hash then _render_attributes(value, out, prefix + attr + '-')
        else
          out << " #{prefix}#{attr}='#{value}'"
        end
      end
    end
  end
end
