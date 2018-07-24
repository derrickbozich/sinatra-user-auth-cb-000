class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :home
  end

  get '/registrations/signup' do
    erb :'/registrations/signup'
  end

  post '/registrations' do
    @user = User.create(params)

    session[:id] = @user.id
    redirect '/users/home'
  end

  get '/sessions/login' do
    erb :'sessions/login'
  end

  post '/sessions' do
    binding.pry
    # @user = User.find_by_id(session[:id])
    User.find

    redirect '/users/home'
  end

  get '/sessions/logout' do
    session = {}
    redirect '/'
  end

  get '/users/home' do

    @user = User.find_by_id(session[:id])
    erb :'/users/home'
  end

end
