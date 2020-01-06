require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require './environments'

set :database, adapter: ''

get '/' do
  erb :home
end

get '/home' do
  erb :home
end

get '/posts' do
  erb :posts
end

get '/login' do
  erb :login
end

get '/signup' do
  erb :signup
end