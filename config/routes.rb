Rails.application.routes.draw do
  devise_for :users
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :packing_lists, only: [ :index, :show, :new, :create ]
end
