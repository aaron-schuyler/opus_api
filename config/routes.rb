Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :docs, only: [:index, :show, :create, :update, :destroy]
  post 'docs/:id/share/:user_id', to: 'shares#create'
  delete 'docs/:id/share/:user_id', to: 'shares#destroy'
  resources :folders, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
