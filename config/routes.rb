Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :items, only: [ :new, :create ]

  resources :packing_lists, only: [ :index, :show, :new, :create ] do
    resources :packing_list_items, only: [ :new, :create ]
  end
end
