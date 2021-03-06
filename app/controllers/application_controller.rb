require "./config/environment"
require "./app/models/user"

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "password_security"
  end

  get "/" do
    if Helpers.logged_in?(session)
      redirect to "/users"
    else
    erb :"users/index"
    end
  end

  get "/logout" do 
    if Helpers.logged_in?(session)
    session.clear
    redirect to "/"
    else 
    redirect to "/"
    end
  end

  post "/logout" do 
    redirect to "/logout"
  end



end
