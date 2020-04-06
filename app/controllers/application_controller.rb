require './config/environment'

class ApplicationController < Sinatra::Base
  enable :sessions


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :sessions_secret, "tip_secure"
  end

  get "/" do
    if Helpers.logged_in?(session)
      redirect to '/users/'
    end
    erb :"users/index"
  end


end
