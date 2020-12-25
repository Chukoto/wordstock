Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'

  resources :contents, only: [:index, :new, :create, :show] do
    resources :descriptions, only: [:new, :create]
  end
end
