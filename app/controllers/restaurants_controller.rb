class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]


  def index
      @restaurant = Restaurant.all

      if render_success(data: {
            restaurant: @restaurant
        })
      else
        render_error message: "Data not Found"
      end

  end

  def show
    if render_success(data: {
            restaurant: @restaurant
        })
    else
      render_error message: "Data Not Found"
    end
  
  end


  def create
      @restaurant = Restaurant.create(restaurant_params)
      if @restaurant.save
        render_success message: "restaurant has been created", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not Created"
      end
  end

  def update
    if @restaurant.update(restaurant_params)
      render_success message: "restaurant has updated successfully", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not Updated"
      end

  end

  def destroy
    if @restaurant.destroy
      render_success message: "restaurant has deleted successfully", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not deleted"
      end

    
  end
    
  private 
    
  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_no_1, :phone_no_2, :address, :home_delivery,
    :open_till, :description)
  end


  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
