class Ice_creamsController < ApplicationController
  def index
    @ice_creams = Ice_cream.all
  end

  def create
     @ice_cream = Ice_cream.new(params[:ice_cream])
    if @ice_cream.save
      redirect_to ice_creams_path
    else
      render :new
    end
  end

  def new
    @ice_cream = Ice_cream.new
  end
  def destroy
    ice_cream = Ice_cream.find(params[:id])
    ice_cream.destroy
    redirect_to ice_creams_path
  end
end


