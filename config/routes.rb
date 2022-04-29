# frozen_string_literal: true

Rails.application.routes.draw do
  get '/@:user_id', to: 'users#default_resume'
  get '/@:user_id/:id', to: 'resumes#show', as: 'user_resume'

  resources :resumes do
    collection do
      get :my
    end

    member do
      patch :pin
      post :buy
    end
  end

  resources :orders, only: [] do
    member do
      get :checkout
      post :pay
    end
  end

  resource :users, only: [:create] do
    get :sign_up
    get :sign_in
  end

  resource :sessions, only: %i[create destroy]

  namespace :admin do
    resources :vendors, except: [:show]
    resources :users, only: [:index]
  end

  namespace :api do
    namespace :v1 do
      resources :resumes, only: [] do
        member do
          post :like
          delete :unlike
        end
      end
    end
  end

  root 'resumes#index'
end
