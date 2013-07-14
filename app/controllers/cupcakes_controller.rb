class CupcakesController < ApplicationController

  def index
    if !current_user
      redirect_to '/'
      @cupcakes = Cupcake.all
    end
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

  def edit
    @cupcake = Cupcake.find(params[:id])
  end

  def update
    @cupcake = Cupcake.find(params[:id])
    if @cupcake.update_attributes(params[:cupcake])
      redirect_to cupcake_path(@cupcake)
    else
      render :edit
    end
  end
  def destroy
    cupcake = Cupcake.find(params[:id])
    cupcake.destroy
    redirect_to cupcakes_path
  end

  def win
  end

  def lose
  end
end 