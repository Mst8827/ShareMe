Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts, only: [:new, :create, :destroy, :edit, :update]
  resources :users, only: :show
  
end
