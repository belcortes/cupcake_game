class FrostingsController < ApplicationController
  def index
    @frostings = Frosting.all
  end

  def create
     @frosting = Frosting.new(params[:frosting])
    if @frosting.save
      redirect_to frostings_path
    else
      render :new
    end
  end

  def new
    @frosting = Frosting.new
  end
  def destroy
    frosting = Frosting.find(params[:id])
    frosting.destroy
    redirect_to frostings_path
  end
end