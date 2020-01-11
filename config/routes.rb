Rails.application.routes.draw do

  resources :timelines do
    collection do
      post :confirm
    end
  end
  resources :sessions, only:[:new,:create,:destroy]
  resources :users, only: [:new, :create, :show]
  resources :relationships, only: [:index,:create,:destroy]
end
