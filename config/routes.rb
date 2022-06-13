# config/routes.rb
Rails.application.routes.draw do
  root to: 'warehouses#index'

  # Warehouses with nested Items
  resources :warehouses do
    resources :items, only: %i[show]
  end

  # Items
  resources :items, only: %i[new create edit update delete]
end
