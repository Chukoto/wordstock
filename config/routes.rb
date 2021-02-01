Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  get "contents/about" => "contents#about"

  root to: 'contents#index'

  resources :diaries
  resources :profiles, except: [:index, :destroy]

  resources :contents, except: [:destroy] do
    resources :descriptions, except: [:index, :show]
    resources :sentences, except: [:index, :show]
    resources :contents_histories, only: [:show]
    collection do
      get 'search'
    end
  end
end
