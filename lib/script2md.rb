require "script2md/version"

module Script2md
  def self.convert(text)
    output = Convert.new(text).convert.text
    output = output
     output
  end

  class Convert
    def initialize(text)
      @text = text
    end

    attr_reader :text

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
      text.gsub!(/((^(?!#)[^\n\r].+[\n\r]?)(^(?!#).[^\n\r]*[\n\r]?)*)/, "```bash\n\\1```\n")
    end

    def headling_comment_to_plaintext!
      text.gsub!(/^#\s+?$/, "")
      text.gsub!(/^#\s+?([^\n\r]+)$/, "\\1")
    end

    def format!
      text.gsub!(/\A[\n\r]+|[\n\r]+\z/, '') # Remove trailing empty lines
    end
  end
end
