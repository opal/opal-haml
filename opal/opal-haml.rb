require 'template'

class Template
  class OutputBuffer
    alias << append

    # allow tags in haml to have dynamic attributes
    def attributes(class_id, obj_ref, *attributes_hashes)
      attributes = class_id

      attributes_hashes.each do |hash|
        attributes.update hash do |_, oldval, newval|
          Array(oldval) + Array(newval)
        end
      end

      result = []
      _render_attributes attributes, result, ''

      result.join
    end

    private

    def _render_attributes(attributes, out, prefix)
      attributes.each do |attr, value|
        attr_name = prefix + attr

        case value
        when true then out << " #{attr_name}"
        when false, nil then next
        when Hash then _render_attributes(value, out, attr_name + '-')
        else
          value = value.compact.join ' ' if value.is_a? Array
          out << " #{attr_name}='#{_attribute_escape value}'"
        end
      end
    end

    def _attribute_escape(value)
      value.to_s.gsub /['"&<>]/, '"' => '&quot;', "'" => '&apos;', '&' => '&amp;', '<' => '&lt;', '>' => '&gt;'
    end
  end
end
