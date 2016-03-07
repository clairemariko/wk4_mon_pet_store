require('sinatra')
require('pry-byebug')
require_relative('controllers/pets_controller')
require_relative('controllers/stores_controller')
require 'sinatra/contrib/all' if development?


get '/' do
  erb :home
end