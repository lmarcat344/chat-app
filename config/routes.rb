Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users
  # resources :users, only: :edit
  # get '/users/:id/edit', to: 'users#edit'
end
