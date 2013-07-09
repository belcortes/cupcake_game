class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
  end

  def new
    @cookie = Cookie.new
  end

  def destroy

  end
end