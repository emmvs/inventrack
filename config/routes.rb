# config/routes.rb
Rails.application.routes.draw do
  root to: 'warehouses#index'

  # Warehouses with nested Items
  resources :warehouses do
    resources :items, only: %i[index show new create]
  end

  # Items
  resources :items, only: %i[edit update delete]
end
