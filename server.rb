require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require 'pg'
require './models'

set :database, {adapter: 'postgresql', database: 'User', 
username: 'srikar', password: ENV['PG'] }
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
  @user=User.new(params[:user])
  erb :signup
end

post '/login' do

  @user = User.find_by(email: params[:email])
  if @user.password == params[:password]

    session[:user_id] = @user.id

    redirect "/profile"
  else

    flash[:warning] = "Your email or password is incorrect"


    redirect "/"
  end
end

post "/signup" do
  @user = User.new(params[:user])
    if @user.valid?
      puts @user
      @user.save
      redirect "/profile"
    end  
end


get "/logout" do

  session[:user_id] = nil

  redirect "/"
end

get "/profile" do

  @user = User.find(session[:user_id])
  @name = @user.username
  @posts = @user.posts

  erb :profile
end



