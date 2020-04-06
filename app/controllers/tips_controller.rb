class TipsController < ApplicationController

  # GET: /tips
  get "/tips" do
    erb :"/tips/index.html"
  end

  # GET: /tips/new
  get "/tips/new" do
    erb :"/tips/new.html"
  end

  # POST: /tips
  post "/tips" do
    redirect "/tips"
  end

  # GET: /tips/5
  get "/tips/:id" do
    erb :"/tips/show.html"
  end

  # GET: /tips/5/edit
  get "/tips/:id/edit" do
    erb :"/tips/edit.html"
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
