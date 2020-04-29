Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments
    get 'tags/new', to: 'tags#new'
    get 'tags/:id/edit', to: 'tags#edit'
  end
  resources :tags
end
