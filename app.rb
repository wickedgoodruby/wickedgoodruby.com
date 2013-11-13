require 'bundler'
Bundler.setup
require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

set :public_folder, File.dirname(__FILE__) + '/public'

helpers do
  def h(text)
    Rack::Utils.escape_html(text)
  end
end

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

require_relative 'routes/init'
