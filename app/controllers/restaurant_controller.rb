class RestaurantController < ApplicationController


def index
    render json: Restaurant.all
end

def show
  @restaurant = Restaurant.find(params[:id])
  render json: @restaurant
end


def new
    @restaurant = Restaurant.new
end

def create
    @restaurant = Restaurant.create(user_params)
    render json: @restaurant
end

def edit
  @restaurant = Restaurant.find(params[:id])
end

def update
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(user_params)

  redirect_to restaurant_path(@restaurant)
end

def destroy
  @restaurant = Restaurant.find(params[:id])
  @restaurant.destroy

  
end
  
private 
  
def user_params
  params.require(:restaurant).permit(:name, :phone_no_1, :phone_no_2, :address, :home_delivery, :delivery_time,
  :delivery_charge, :description, :other_details)
end

end
