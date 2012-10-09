require 'bundler'
Bundler.setup
require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

set :public_folder, File.dirname(__FILE__) + '/static'

configure do
  Compass.configuration do |config|
    config.project_path = File.dirname(__FILE__)
    config.sass_dir = 'views'
  end

  set :haml, { :format => :html5 }
  set :sass, Compass.sass_engine_options
end

get '/application.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :application
end

get '/' do
  haml :index
end
