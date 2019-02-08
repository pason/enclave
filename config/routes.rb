Rails.application.routes.draw do
  namespace :api do
    resources :maps, only: [:index]
    resources :islands, only: [:index, :show]
  end
end
