require File.expand_path('../app', __FILE__)

require 'sprockets-sass'
require 'sass'

map '/assets' do
  environment = Sprockets::Environment.new
  environment.append_path 'assets/stylesheets'
  environment.append_path 'assets/javascripts'
  run environment
end

run Sinatra::Application