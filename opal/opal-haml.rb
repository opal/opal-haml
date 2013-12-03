require 'template'

class Template
  class OutputBuffer
    def buffer
      self
    end

    alias << append
  end
end
