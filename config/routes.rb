Rails.application.routes.draw do
  resource :session
  resources :passwords, param: :token
  # resources :products # criaria automaticamente todas as rotas padrão para CRUD
  # não utilizarei para aprender a fazer as rotas na mão.
  root "products#index" # localhost:3000 levará ao index.


  # new (mostra o formulário em branco) and create (post para o form)
  get "products/new", to: "products#new", as: "new_product"
  post "products", to: "products#create"

  # edit and update
  get "products/:id/edit", to: "products#edit", as: "edit_project"
  patch "products/:id", to: "products#update"
  put "products/:id", to: "products#update"

  # Index (list) and show (only one)
  get "products", to: "products#index"
  get "products/:id", to: "products#show", as: "product"

  # Delete items
  delete "products/:id", to: "products#destroy", as: "destroy_product"
end
