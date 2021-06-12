class Dish < ApplicationRecord



    # ======================== MODULES INCLUSION ====================== #
    include DishPresenter
    # ======================== CONSTANTS ============================== #
    # ======================== SCOPES ================================= #
    # ======================== ASSOCIATIONS =========================== #
    belongs_to :restaurant
    has_and_belongs_to_many :orders
    # ======================== ENUMS ================================== #
    # ======================== VALIDATIONS ============================ #
    validates :dish_name, :restaurant_id, :price, :is_veg, presence: true
    # ======================== CALLBACKS ============================== #
    # ======================== OTHERS ================================= #
    # ======================== CLASS METHODS ========================== #
    # ======================== INSTANCE METHODS ======================= #
 
end
