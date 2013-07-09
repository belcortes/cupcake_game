class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
  end

  def new
    @cooky = Cookie.new
  end

  def destroy
    
  end
end