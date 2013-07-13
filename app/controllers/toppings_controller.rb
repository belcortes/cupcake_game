class ToppingsController < ApplicationController
  def index
    @toppings = Topping.all
    render :json => @toppings.to_json
  end

  def create
     @topping = Topping.new(params[:topping])
    if @topping.save
      redirect_to toppings_path
    else
      render :new
    end
  end

  def new
    @topping = Topping.new
  end
  def destroy
    topping = Topping.find(params[:id])
    topping.destroy
    redirect_to toppings_path
  end
end


