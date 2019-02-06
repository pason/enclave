Rails.application.routes.draw do
  resources :maps, only: [:index, :create]
end
