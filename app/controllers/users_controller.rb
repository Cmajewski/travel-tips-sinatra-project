class UsersController < ApplicationController


  # User Signup form- GET: /users/new  
  get "/users/new" do
    erb :"/users/new"
  end
 

  #Redirected once a user signs up- POST: /users
  post "/users/new" do
    @user=User.new(name: params[:name], username: params[:username],password: params[:password])
     if @user.valid?
        @user.save
        session[:user_id] = @user.id
        redirect to "/users"
      else
        #flash[:message]="Invalid Login, Please Sign Up Again"
        redirect to "/users/new"
      end
    end

  #Redirected once a user logs in
  post "/users" do
    @user = User.find_by(:username => params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id]=@user.id
        redirect "/users"
      else
        #flash[:message]="Invalid Login, Please Sign Up Again"
        redirect to "/users/new"
      end
  end

  #User Homepage showing any travel tips-  GET: /users
  get "/users" do
     if Helpers.logged_in?(session)
      @users=Helpers.current_user(session)
      erb :"/tips/index"
     else
      redirect to "/users"
     end
  end

  
  # GET: /users/5/edit
  get "/users/:id/edit" do
    if Helpers.logged_in?(session)
      redirect to "/users/new"
    else
    erb :"/users/edit"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end

 

end
