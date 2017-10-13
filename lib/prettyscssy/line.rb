module Scss
  class Line
    def initialize(text)
      @text = text
    end

    def key
      @key ||= text.split(':')[0]&.strip
    end

    def value
      @value ||= text.split(':')[1]&.strip
    end

    def key_length
      return 0 if comment? || wrong_segment_count?
      key.length
    end

    def beautify(block_key_length, indentation)
      text = add_spaces(block_key_length, indentation)
      clean_formatting(text)
    end

    def add_spaces(block_key_length, indentation)
      return text if invalid?

      indentation_spaces = ' ' * (indentation * 2)
      leading_spaces     = ' ' * (1 + block_key_length - key_length)

      "#{indentation_spaces}#{key}:#{leading_spaces}#{value}"
    end

    def clean_formatting(text)
      bad_colon_regex = /&:\s+/
      text = text.gsub(bad_colon_regex, '&:') if bad_colon_regex.match?(text)
      text
    end

    def indentation_change
      change  = 0
      change += 1 if text.strip.end_with? '{', '('
      change -= 1 if text.strip.start_with? '}', ')', '};', ');'
      change
    end

    private

    attr_accessor :text

    def invalid?
      wrong_segment_count? || invalid_value? || comment? || brackety?
    end

    def wrong_segment_count?
      text.split(':').length != 2
    end

    def invalid_value?
      value.nil?
    end

    def comment?
      text.strip.start_with? '//', '/*', '*/'
    end

    def brackety?
      brackety_characters = ['{', '}', '(', ')', '[', ']']
      brackety_characters.any? { |c| text.include? c }
    end
  end
end
