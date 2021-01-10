Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  root to: 'contents#index'

  resources :diaries, only: [:index, :show, :new, :create, :edit, :update]
  resources :profiles, only: [:show, :new, :create, :edit, :update]

  resources :contents, only: [:index, :new, :create, :show, :edit, :update] do
    resources :descriptions, only: [:new, :create, :edit, :update, :destroy]
    resources :sentences, only: [:new, :create, :edit, :update, :destroy]
    resources :contents_histories, only: [:show]
  end
end
