class TipsController < ApplicationController

  # GET: /tips
  get "/tips" do
    if !Helpers.logged_in?(session)
      erb :"/users/new"
    else 
    @user=Helpers.current_user(session)
    erb :"/tips/index"
    end
  end

  # GET: /tips/new
  get "/tips/new" do
    if !Helpers.logged_in?(session)
    erb :"/"
    else 
      redirect to "/tips/new"
    end
  end

  # POST: /tips
  post "/tips" do
      session[:picture]=params[:images]
      @destination=Helpers.find_or_create_destination(params[:city_name])
      @tip=Tip.new(name: params[:spot],type_of_place: params[:type_of_place],description: params[:description],user_id: session[:user_id],destination_id: @destination.id)  
      if @tip.valid?
           @tip.save
           redirect "/tips"
        else
        redirect to "tips/failure"
      end      
    end

     # GET failure message to redirect
  get "/tips/failure" do
    if !Helpers.logged_in?(session)
      erb :"tips/failure"
      else 
      erb :"/users/new"
    end
  end

  # GET: /tips/5
  get "/tips/:id" do
  if !Helpers.logged_in?(session)
    erb :"/users/new"
  else 
    @tip=Tip.find(params[:id])
    erb :"/tips/show"
  end
  end

  # GET: /tips/5/edit
  get "/tips/:id/edit" do
    erb :"/tips/edit"
  end

  # PATCH: /tips/5
  patch "/tips/:id" do
    redirect "/tips/:id"
  end

  # DELETE: /tips/5/delete
  delete "/tips/:id/delete" do
    redirect "/tips"
  end
end
