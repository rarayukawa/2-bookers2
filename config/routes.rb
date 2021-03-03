Rails.application.routes.draw do
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  devise_for :users
  
  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :users,only: [:show,:index,:edit,:update]
  resources :books do
  resources :book_comments, only: [:create, :destroy]
  resource :favorites, only: [:create, :destroy]
  end
end