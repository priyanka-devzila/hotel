class DishesController < ApplicationController
  before_action :get_restaurant 
  before_action :set_dish, only: [:show, :update, :destroy]
  


  def index
    @dishes = @restaurant.dishes
    if render_success message: "Dish Created Successfully", data: {
              Dishes: @dishes
          }
        else
          render_error message: "Data not Found"
        end

  end

  def show
    @dish = @restaurant.dishes.find(params[:id])
    render_success(data: {
      dish: @dish
  })
  end


  def create
      if @dish = @restaurant.dishes.create(dish_params)
        render_success message: "Dish Created Successfully", data: {
          dish: @dish 
        }
      else
        render_error message: "Not Created"
      end
  end

  def update
    if @dish = @restaurant.dishes.update(dish_params)
      render_success message: "Dish Updated Successfully", data: {
        dish: @dish
      }
    else
      render_error message: "Not Updated"
    end
  end


  def destroy
    if @restaurant.dishes.destroy
      render_success message: "Dish deleted Successfully"
    else
      render_error message: "Not Deleted"
    end
  end
    
  private 
    
  def dish_params
    params.require(:dish).permit(:dish_name, :price, :quantity, :restaurant_id, :rating, :description, :ingredients, :is_veg)
  end

  def set_dish
    @dish = @restaurant.dishes.find(params[:id])
  end
  
  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
  



      
end
