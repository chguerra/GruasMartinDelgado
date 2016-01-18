Rails.application.routes.draw do
  
  devise_for :users

  get "/" => "site#home"

  get "/clientuser" => "site#clientuser"

  get "/pendientes" => "deliveries#pendientes"

  post "/update/pendientes/:id" => "deliveries#pending"

  get "/ver_cargas" => "deliveries#ver_cargas"

  get "/transportes" => "deliveries#index"

  post "/customreport" => "site#customreport"

  post "/deliveredreport" => "site#deliveredreport"

  resources :clients, only: [:update, :edit, :show, :new, :index, :create, :destroy] do
  	resources :deliveries, only: [ :update, :edit, :show, :new, :create, :destroy]
  end

  resources :trucks, only: [:update, :edit, :show, :new, :index, :create, :destroy]

  resources :drivers, only: [:update, :edit, :show, :new, :index, :create, :destroy]
end
