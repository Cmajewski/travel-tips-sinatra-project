class DestinationsController < ApplicationController

  # GET: /destinations
  get "/destinations" do
    if !Helpers.logged_in?(session)
      erb :"/users/new"
    else 
    @user=Helpers.current_user(session)
    @destination=Destination.all
    erb :"destinations/index"
    end
  end

  get "/destination/:id" do
    if !Helpers.logged_in?(session)
      erb :"/users/new"
    else 
      @destination=Destination.find(params[:id])
      erb :"/destinations/show"
    end
    end


end


