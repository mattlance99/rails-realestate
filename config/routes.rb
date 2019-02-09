Rails.application.routes.draw do
  resources :properties
  resources :agents
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'



  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback' => 'session#create'
  get '/auth/github/callback' => 'sessions#create'
end
