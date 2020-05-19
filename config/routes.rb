Rails.application.routes.draw do
  devise_for :users
  resources :templates

  root "templates#index"
end
