require 'cgi'
wp_syntax = [
  "actionscript3",
  "bash",
  "clojure",
  "cpp",
  "csharp",
  "css",
  "delphi",
  "diff",
  "erlang",
  "fsharp",
  "go",
  "groovy",
  "html",
  "java",
  "javafx",
  "javascript",
  "latex",
  "matlab",
  "objc",
  "php",
  "powershell",
  "python",
  "r",
  "ruby",
  "scala",
  "sql",
  "text",
  "vb",
  "xml"
]

hatena_syntax = {
  :actionscript3 => "actionscript",
  :bash => "sh",
  :clojure => "clojure",
  :cpp => "cpp",
  :csharp => "csharp",
  :css => "css",
  :delphi => "pascal",
  :diff => "diff",
  :erlang => "erlang",
  :fsharp => "fsharp",
  :go => "go",
  :groovy => "groovy",
  :html => "html",
  :java => "java",
  :javafx => "java",
  :javascript => "javascript",
  :latex => "tex",
  :matlab => "matlab",
  :objc => "objc",
  :php => "php",
  :powershell => "ps1",
  :python => "python",
  :r => "r",
  :ruby => "ruby",
  :scala => "scala",
  :sql => "sql",
  :text => "",
  :vb => "vb",
  :xml => "xml"
}

file = File.open(ARGV[0])
string = CGI.unescapeHTML(file.read)

string.gsub!("[code]","```")
string.gsub!("[/code]","```")
wp_syntax.each do |syntax|
  string.gsub!("[code language=\"#{syntax}\"]","```#{hatena_syntax[syntax.to_sym]}")
end
string.gsub!(/<img class="(.*?)" src="(.*?)" alt="(.*?)" width="(.*?)" height="(.*?)" \/>/,'<img class="\1" src="\2" alt="\3" />')

File.write "wordpress.xml", string
