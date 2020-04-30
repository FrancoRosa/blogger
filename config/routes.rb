Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :author_sessions, only: [ :new, :create, :destroy ]

  get 'login'  => 'author_sessions#new'
  get 'logout' => 'author_sessions#destroy'
  
  root to: 'articles#index'

  resources :articles do
    resources :comments
    resources :tags, only: [:new, :create] 
  end
  resources :tags, expect: [:new, :create]
  resources :authors
end
