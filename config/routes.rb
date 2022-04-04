Rails.application.routes.draw do
  resources :tracks
  resources :artists
  resources :tags
  root to: 'pages#home'
  devise_for :users
  
  resources :records
  resources :boxes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
