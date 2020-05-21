Rails.application.routes.draw do
  devise_for :users, controller:{ registrations: 'registrations'}
  
  
  
  resources :organizations do
  	resources :templates
  	resources :memberships, only: [:create]
  	resources :categories
  	
  end
  resources :users, only: [:show]
  resources :home, only:[:index]


  root "home#index"
end
