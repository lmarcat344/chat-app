Rails.application.routes.draw do
  devise_for :users
  get 'messages/index'
  root to: "messages#index"
  resources :users
  # resources :users, only: :edit             ##view/edit.html.erbも変える
  # get '/users/:id/edit', to: 'users#edit'   ##同上
  resources :rooms
end
