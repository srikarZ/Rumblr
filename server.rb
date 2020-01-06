require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require './environments'
require 'pg'

set :database, {adapter: 'postgresql', database: 'users', 
username: 'postgres', password: ENV['PG'] }
enable :sessions

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

