Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'

  resources :contents, only: [:index, :new, :create, :show, :edit, :update] do
    resources :descriptions, only: [:new, :create]
    resources :sentences, only: [:new, :create]
  end
end
