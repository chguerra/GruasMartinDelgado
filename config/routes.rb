Rails.application.routes.draw do
  get "/" => "site#home"

  resources :clients, only: [:update, :edit, :show, :new, :index, :create, :destroy] do
  	resources :deliveries, only: [:update, :edit, :show, :new, :index, :create, :destroy]
  end
end
