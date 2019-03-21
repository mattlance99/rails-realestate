Rails.application.routes.draw do
  resources :properties
  resources :agents
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]

  resources :agents, only: [:show, :index] do
    resources :properties, only: [:show, :index, :new, :edit]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/properties/:id/next' => 'properties#next'

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'sessions#create'
end
