Rails.application.routes.draw do
  root 'index#index'
  namespace :api do
    resources :maps, only: [:create, :show]
    resources :islands, only: [:index, :show]
  end
end
