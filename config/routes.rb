Rails.application.routes.draw do
  namespace :api do
    resources :maps, only: [:create]
    resources :islands, only: [:index, :show]
  end
end
