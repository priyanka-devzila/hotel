class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :update, :destroy]


  def index
      @restaurant = Restaurant.all
      @restaurant = apply_pagination @restaurant

      if render_success(data: {
            restaurant: @restaurant.as_api_response(:base),
            pagination: pagination(@restaurant)
        })
      else
        render_error message: "Data not Found"
      end

  end

  def show
    if render_success(data: {
            restaurant: @restaurant.as_api_response(:base)
        })
    else
      render_error message: "Data Not Found", data: {error: @restaurant.errors}
    end
  
  end


  def create
      @restaurant = Restaurant.create(restaurant_params)
      if @restaurant.save
        render_success message: "restaurant has been created", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not Created" , data: {error: @restaurant.errors}
      end
  end

  def update
    if @restaurant.update(restaurant_params)
      render_success message: "restaurant has updated successfully", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not Updated", data: {error: @restaurant.errors}
      end

  end

  def destroy
    if @restaurant.destroy
      render_success message: "restaurant has deleted successfully", data: {
            restaurant: @restaurant
        }
      else
        render_error message: "Not deleted", data: {error: @restaurant.errors}
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
