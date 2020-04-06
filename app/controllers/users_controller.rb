class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/show"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new"
  end

  # POST: /users
  post "/users/new" do
    @user=User.new(username: params[:username],password: params[:password])
    if @user.valid?
      @user.save
      session["user_id"]=@user.id
      redirect to "/users"
    else
      flash[:message]="Invalid Login, Please Sign Up Again"
      redirect to "/users/new"
    end
    end

    post "/users" do
    end


  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
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
