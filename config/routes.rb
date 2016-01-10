Rails.application.routes.draw do
  get "/" => "site#home"

  get "/pendientes" => "deliveries#pendientes"

  post "/update/pendientes/:id" => "deliveries#pending"

  get "/ver_cargas" => "deliveries#ver_cargas"

  get "/transportes" => "deliveries#index"

  post "/customreport" => "site#customreport"

  resources :clients, only: [:update, :edit, :show, :new, :index, :create, :destroy] do
  	resources :deliveries, only: [ :update, :edit, :show, :new, :create, :destroy]
  end

  resources :trucks, only: [:update, :edit, :show, :new, :index, :create, :destroy]

  resources :drivers, only: [:update, :edit, :show, :new, :index, :create, :destroy]
end
