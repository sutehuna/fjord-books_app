Rails.application.routes.draw do
  resources :profiles, only: %i[index show edit update]
  devise_for :users
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "books#index"
end
