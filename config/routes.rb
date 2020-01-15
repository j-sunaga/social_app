Rails.application.routes.draw do

  root to: 'sessions#new'

  resources :timelines do
    collection do
      post :confirm
    end
  end
  resources :sessions, only:[:new,:create,:destroy]
  resources :users, only: [:new, :create, :show,:edit,:update]
  resources :relationships, only: [:index,:create,:destroy]
end
