require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require 'pg'
require './models'

set :database, {adapter: 'postgresql', database: 'User', 
username: 'srikar', password: ENV['POSTGRES_RUMBLR_PW'] }
enable :sessions

get '/' do
  erb :home
end

get '/home' do
  erb :home
end

get '/showposts' do
  @user = User.find(session[:user_id])
  @posts = Post.all
  pp @posts
  erb :showposts
end

get '/login' do
  erb :login
end


get '/signup' do
  @user=User.new(params[:user])
  erb :signup
end

post '/login' do
  @user = User.find_by(params[:email])
  inputed_password=params[:password]
  
  if @user and inputed_password = @user.password

    session[:user_id] = @user.id 
    redirect '/profile'

  else 
    redirect '/signup'
  end 
end

post "/signup" do
  @user = User.new(params[:user])
    if @user.valid?
      puts @user
      @user.save
      session[:user_id] = @user.id
      redirect "/profile"
    end  
end


get "/logout" do

  session[:user_id] = nil

  redirect "/"
end

get "/profile" do

  @user = User.find(session[:user_id])
  @post = @user.first_name

  erb :profile
end

post "/profile" do
  @post=Post.new(body: params[:body])
  @post.save
    redirect '/showposts'
end




