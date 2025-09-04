Rails.application.routes.draw do
  root "products#index" # localhost:3000 levará ao index.
  get "products/index"
  resources :products
end
