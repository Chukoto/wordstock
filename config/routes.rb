Rails.application.routes.draw do
  devise_for :users
  root to: 'contents#index'

resources :diaries, only: [:index, :show, :new, :create, :edit, :update]

  resources :contents, only: [:index, :new, :create, :show, :edit, :update] do
    resources :descriptions, only: [:new, :create, :edit, :update, :destroy]
    resources :sentences, only: [:new, :create, :edit, :update, :destroy]
    resources :contents_histories, only: [:show]
  end
end
