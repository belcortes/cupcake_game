class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
    render :json => @toppings.to_json
  end

  def new
    @cookie = Cookie.new
  end

  def create
    @cookie = Cookie.new(params[:cookie])
    if @cookie.save
      redirect_to cookies_path
    else
      render :new
    end
  end

  def destroy
    cookie = Cookie.find(params[:id])
    cookie.destroy
    redirect_to cookies_path
  end
end