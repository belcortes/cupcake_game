class CupcakesController < ApplicationController
  def index
    @cupcakes = Cupcake.all
  end

  def create

  end
end