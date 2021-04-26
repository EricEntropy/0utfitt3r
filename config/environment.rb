ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

configure :development do
  set :database, 'sqlite3:db/database.db'
end 
#found this change online for ActiveRecord 6.0, which is used here vs the one for class 5.2
set :database, {:adapter =>'sqlite3', :database=>'database.db'}

require './app/controllers/application_controller'
require_all 'app'
