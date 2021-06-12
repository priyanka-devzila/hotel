class Restaurant < ApplicationRecord

    # ======================== MODULES INCLUSION ====================== #
  include RestaurantPresenter
  # ======================== CONSTANTS ============================== #
  # ======================== SCOPES ================================= #
  # ======================== ASSOCIATIONS =========================== #
  has_many :dishes
  has_many :orders
  # ======================== ENUMS ================================== #
  # ======================== VALIDATIONS ============================ #
  validates :name, :address, presence: true

  validates :phone_no_1, :phone_no_2, presence: true,
                                      uniqueness: true, 
                                      numericality: { only_integer: true }, 
                                      length: { is: 10 }
  # ======================== CALLBACKS ============================== #
  # ======================== OTHERS ================================= #
  # ======================== CLASS METHODS ========================== #
  # ======================== INSTANCE METHODS ======================= #
    
end
