module PrettyScssy
  class Block
    attr_reader :current_indentation

    def initialize(text)
      @text                = text
      @current_indentation = 0
    end

    def beautify(base_indentation)
      @text = lines.map do |line|
        total_indentation = base_indentation + current_indentation
        beautified_text   = line.beautify(block_key_length, total_indentation)

        @current_indentation += line.indentation_change

        beautified_text
      end.join("\n")
    end

    def lines
      @lines ||= text.split("\n").map do |line_text|
        Line.new(line_text)
      end
    end

    def block_key_length
      @block_key_length ||= lines.max_by(&:key_length).key_length
    end

    private

    attr_accessor :text
  end
end
