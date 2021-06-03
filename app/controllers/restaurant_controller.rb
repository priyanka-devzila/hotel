class RestaurantController < ApplicationController


  def index
      @restaurant = Restaurant.all

      render_success(data: {
            restaurant: @restaurant.as_api_response(:base)
        })
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render json: @restaurant
  end


  def create
      @restaurant = Restaurant.create(restaurant_params)
      render json: @restaurant
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)

  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy

    
  end
    
  private 
    
  def restaurant_params
    params.require(:restaurant).permit(:name, :phone_no_1, :phone_no_2, :address, :home_delivery,
    :open_till, :description)
  end

end
