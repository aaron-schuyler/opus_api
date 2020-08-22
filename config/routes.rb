Rails.application.routes.draw do
  post '/login', to: 'sessions#create'
  get '/check_session', to: 'sessions#check_session'
  delete '/logout', to: 'sessions#destroy'
  get '/docs/search/:search', to: 'docs#index'
  resources :docs, only: [:show, :create, :update, :destroy]
  post 'docs/:id/share/:user_id', to: 'shares#create'
  delete 'docs/:id/share/:user_id', to: 'shares#destroy'
  resources :folders, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
