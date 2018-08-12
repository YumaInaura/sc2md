require "script2md/version"

module Script2md
  def self.convert(text, language_type: nil, source_path: nil)
    output = Convert.new(text, language_type: language_type).convert.text
    output = Fill.new(output, source_path: source_path).convert.text if source_path
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

  class Fill
    def initialize(text, source_path: nil)
      @text = text
      @source_path = source_path
    end

    attr_reader :text

    def convert
      fill_command_output!
      self
    end

    private

    attr_writer :text
    attr_accessor :source_path

    def fill_command_output!
      output = ''
      text.each_line do |line|
        if line == '!OUTPUT!'
          output += "```\n" + `#{source_path}` + "```\n"
        else
          output += line
        end
      end

      self.text = output
    end
  end
end
