require "rake"
$LOAD_PATH <<   File.join(File.dirname(__FILE__), "lib")

desc "Task1"
task :render do
  require "generator"
  include DeckJSBuilder
  build "views/layout.html.haml", "index.html"
end

desc "Rebuild SASS/CSS"
task :style do
  require "generator"
  include DeckJSBuilder
  css
end