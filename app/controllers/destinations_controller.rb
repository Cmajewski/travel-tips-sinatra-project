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

  get "/destinations/:id" do
    if !Helpers.logged_in?(session)
      erb :"/users/new"
    else 
      @destination=Destination.find(params[:id])
      @tips=Tip.select{|tips| tips.destination_id==@destination.id}
      erb :"/destinations/show"
    end
    end


end


