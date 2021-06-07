class DishesController < ApplicationController
  before_action :get_restaurant 
  before_action :set_dish, only: [:show, :update, :destroy]
  


  def index
    @dishes = @restaurant.dishes
    @dishes = apply_pagination @dishes
    if render_success(data: {
              Dishes: @dishes,
              pagination: pagination(@dishes)
          })
    else
      render_error message: "Data not Found", data: {error: @dishes.errors}
    end

  end

  def show
    render_success(data: {
      dish: @dish
  })
  end


  def create
    @dish = @restaurant.dishes.create(dish_params)
    if @dish.save
      render_success message: "Dish Created Successfully", data: {
        dish: @dish 
      }
    else
      render_error message: "Not Created", data: {error: @dish.errors}
    end
  end

  def update
    if @dish.update(dish_params)
      render_success message: "Dish Updated Successfully", data: {
        dish: @dish
      }
    else
      render_error message: "Not Updated", data: {error: @dish.errors}
    end
  end


  def destroy
    if @dish.destroy
      render_success message: "Dish deleted Successfully"
    else
      render_error message: "Not Deleted", data: {error: @dish.errors}
    end
  end
    
  private 
    
  def dish_params
    params.require(:dish).permit(:dish_name, :price, :quantity, :rating, :description, :ingredients, :is_veg)
  end

  def set_dish
    @dish = @restaurant.dishes.find(params[:id])
  end
  
  def get_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
      
end
