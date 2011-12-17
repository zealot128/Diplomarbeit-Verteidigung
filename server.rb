require "bundler/setup"


require "sinatra"
require 'sass'
require "haml"
require "compass"


configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'sass'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

set :root, File.dirname(__FILE__)

get "/css/:name.css" do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"../sass/#{params[:name]}")
end
