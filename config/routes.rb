Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurant, only: [:show, :index, :create, :edit, :update, :destroy]
  
end
