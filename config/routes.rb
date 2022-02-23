Rails.application.routes.draw do
  devise_for :users
  # get 'messages/index'
  # post 'messages', to: 'messages#create'
  resources :rooms do
    resources :messages, only: [:index, :create]
  end
  root to: "rooms#index"
  resources :users
  # resources :users, only: :edit             ##view/edit.html.erbも変える
  # get '/users/:id/edit', to: 'users#edit'   ##同上
  resources :rooms
end
