class IceCreamsController < ApplicationController
  def index
    @ice_creams = IceCream.all
  end

  def create
     @ice_cream = IceCream.new(params[:ice_cream])
    if @ice_cream.save
      redirect_to ice_creams_path
    else
      render :new
    end
  end

  def new
    @ice_cream = IceCream.new
  end
  def destroy
    ice_cream = IceCream.find(params[:id])
    ice_cream.destroy
    redirect_to ice_creams_path
  end
end


