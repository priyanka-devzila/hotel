module RestaurantPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :phone_no_1
      t.add :phone_no_2
      t.add :address
      t.add :home_delivery
      t.add :dishes, template: :base
      t.add :open_till
      t.add :description
    end
  end

end
    