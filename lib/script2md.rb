require "script2md/version"

module Script2md
  def self.convert(text)
    output = text
               .gsub(/^#!.+/, '')
               .gsub(/(^(?!#)[^\n\r].+[\n\r]?)(^(?!#)[^\n\r]*[\n\r]?)*/, "```bash\n\\0\n```\n")
               .gsub(/^#\s?([^\n\r]+)$/, "\\1\n")
     
     output
  end
end
