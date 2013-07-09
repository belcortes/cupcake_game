class CupcakesController < ApplicationController
  def index
    @cupcakes = Cupcake.all
  end

  def create
     @cupcake = Cupcake.new(params[:cupcake])
    if @cupcake.save
      redirect_to cupcakes_path
    else
      render :new
    end
  end

  def new
    @cupcake = Cupcake.new
  end
  def destroy
    cupcake = Cupcake.find(params[:id])
    cupcake.destroy
    redirect_to cupcakes_path
  end
end