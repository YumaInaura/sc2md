require "script2md/version"

module Script2md
  def self.convert(text, language_type: nil)
    output = Convert.new(text, language_type: language_type).convert.text
    output
  end

  class Convert
    def initialize(text, language_type: nil)
      @text = text
      @language_type = language_type
    end

    attr_reader :text, :language_type

    def convert
      remove_shebang!
      code_into_codeblock!
      headling_comment_to_plaintext!
      format!
      self
    end

    private

    attr_writer :text

    def remove_shebang!
      text.gsub!(/^#!.+/, '') 
    end

    def code_into_codeblock!
      text.gsub!(/(^(?!#).+$\n?)((^(?!#).*$\n?)*(^(?!#).+$))?/, "```#{language_type}\n\\0\n```")
    end

    def headling_comment_to_plaintext!
      text.gsub!(/^#\s+?$/, "")
      text.gsub!(/^#\s+?([^\n\r]+)$/, "\\1")
    end

    def format!
      text.gsub!(/\A[\n\r]+|[\n\r]+\z/, '')
    end
  end
end
