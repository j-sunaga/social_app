Rails.application.routes.draw do

  resources :sessions, only:[:new]
  resources :users, only: [:new, :create, :show]

end
