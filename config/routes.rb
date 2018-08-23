Rails.application.routes.draw do
  resources :guitars
  root to: 'guitars#index'
  devise_for :users
  resources :users
end
