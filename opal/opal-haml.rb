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

      result = attributes.collect do |attr, value|
        if value == true
          next " #{attr}"
        elsif value == false
          next
        else
          " #{attr}='#{value}'"
        end
      end

      result.join
    end
  end
end
