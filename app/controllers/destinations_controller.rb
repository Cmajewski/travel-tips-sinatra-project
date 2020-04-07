class DestinationsController < ApplicationController

  # GET: /destinations
  get "/destinations" do
    @user=Helpers.current_user(session)
    erb :"destinations/index"
  end

  get "/help" do
    @user=Helpers.current_user(session)
    erb :"destinations/file"
  end

  post "/file/post" do
  params[:images]=@image
  erb :'destination/testing"
  end


end
