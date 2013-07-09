class CookiesController < ApplicationController
  def index
    @cookies = Cookie.all
  end
end