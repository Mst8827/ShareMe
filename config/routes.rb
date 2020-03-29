Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
    resources :comments, only: :create
    collection do
      get 'search'
    end
    member do
      post   '/like/:post_id' => 'likes#like',   as: 'like'
      delete '/like/:post_id' => 'likes#dislike', as: 'dislike'
    end
  end
  resources :users, only: :show
  
end
