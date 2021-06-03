class DishController < ApplicationController


def index
  restaurant = Restaurant.find_by(id: params[:restaurant_id])
  dishes = restaurant.dishes
  render_success(data: {
    dish: restaurant.as_api_response(:base)
      })


end

def show
  @dish = Dish.find(params[:id])
  render json: @dish
end


def create
    @dish = Dish.create(dish_params)
    render_success message: "Dish Created Successfully", data: {dish: @dish }
end

def update
  @dish = Dish.find(params[:id])
  @dish.update(dish_params)
  render_success message: "Dish Updated Successfully", data: {
    dish: @dish
  }

end

def destroy
  @dish = Dish.find(params[:id])
  @dish.destroy
  render_success message: "Dish deleted Successfully"

  
end
  
private 
  
def dish_params
  params.require(:dish).permit(:dish_name, :price, :quantity, :restaurant_id)
end

def dishes 
  dishes = Dish.all
end



end
