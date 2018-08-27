Rails.application.routes.draw do
  root to: 'guitars#index'
  devise_for :users
  resources :users
  resources :accessories
  resources :cart, only: [:destroy]
  resources :guitars

  post 'add_to_cart', to: 'cart_items#add_to_cart'
  delete 'remove_from_cart/:id', to: 'cart_items#remove_from_cart', as: :remove_from_cart
  post 'update_quantity/:id', to: 'cart_items#update_quantity', as: :update_quantity
  get 'my_cart/:id', to: 'carts#cart_page', as: :my_cart
  get 'checkout', to: 'users#checkout', as: :checkout_page
end
