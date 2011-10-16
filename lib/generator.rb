require "haml"
require "yaml"
module DeckJSBuilder
  MAIN_DIR = File.join File.dirname(__FILE__), ".."


  META = YAML.load_file File.join(MAIN_DIR, "meta.yml")

  def render(path,b=binding)
    path = File.join MAIN_DIR, path
    Haml::Engine.new(IO.read(path)).render(b)
  end
  def build(from_file, to_file)
    text = render from_file, binding
    write_to = File.join MAIN_DIR, to_file
    File.open(write_to,"w+") {|f| f.write text}
    puts "Written #{write_to}"
  end

  def css
    puts `bundle exec compass compile #{MAIN_DIR} 2>&1`
  end
end

