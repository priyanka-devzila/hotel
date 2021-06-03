module DishPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :dish_name
      t.add :price
      t.add :quantity
    end
end


    