Rails.application.routes.draw do

  resources :timelines
  resources :sessions, only:[:new,:create,:destroy]
  resources :users, only: [:new, :create, :show]

end
