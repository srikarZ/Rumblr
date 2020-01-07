require 'sinatra/activerecord'
require 'sinatra'
require 'sinatra/flash'
require 'pg'

set :database, {adapter: 'postgresql', database: 'USER', 
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
  erb :signup
end

post '/login' do

  @user = Users.find_by(email: params[:email])
  if @user.password == params[:password]

    session[:user_id] = @user.id

    redirect "/profile"
  else

    flash[:warning] = "Your email or password is incorrect"


    redirect "/"
  end
end

post "/sign-up" do
  @user = Users.create(
    first_name: params[:first_name],
    last_name: params[:last_name],
    birthday: params[:birthday],
    email: params[:email],
    password: params[:password],
  )
  @name = params[:first_name]

  session[:user_id] = @user.id

  redirect "/profile"
end


get "/logout" do

  session[:user_id] = nil

  redirect "/"
end

get "/profile" do

  @user = Users.find(session[:user_id])
  @name = @user.username
  @posts = @user.posts

  erb :profile
end



