Rails.application.routes.draw do
  #existing routes
  resources :toys, only: [:index, :create, :update]
end
