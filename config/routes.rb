Rails.application.routes.draw do
  resources :properties
  resources :agents
  resources :clients, only: [:index, :show, :new, :create, :edit, :update]

  resources :agents, only: [:show] do
    resources :clients, only: [:show, :index]
  end



  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'



  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'session#create'
  get '/auth/github/callback' => 'sessions#create'
end
