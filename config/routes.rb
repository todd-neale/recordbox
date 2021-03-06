Rails.application.routes.draw do

  root to: 'pages#home'
  devise_for :users

  resources :users, only: [:show]
  resources :boxes
  resources :tags
  
  resources :records, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
