module Scss
  class Document
    def initialize(path)
      @path        = path
      @indentation = 0
    end

    def beautify
      write(beautified_text)
    end

    private

    attr_accessor :path, :indentation

    def write(text)
      File.open(path, 'w') do |f|
        f.puts text
      end
    end

    def text
      @text ||= File.read(path)
    end

    def blocks
      @blocks ||= text.split("\n\n").map do |block_text|
        Block.new(block_text)
      end
    end

    def beautified_text
      blocks.map do |block|
        text = block.beautify(indentation)

        @indentation += block.current_indentation

        text
      end.join("\n\n")
    end
  end
end
