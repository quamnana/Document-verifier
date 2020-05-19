Rails.application.routes.draw do
  devise_for :users
  
  resources :templates
  resources :organizations

  root "templates#index"
end
