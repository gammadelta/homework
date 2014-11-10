GoogleAuthExample::Application.routes.draw do
  get "assignments/new"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'post', to:'assignments#new'
  get 'my-posts', to:'assignments#show'

  resources :sessions, only: [:create, :destroy]
  resource :home, only: [:show]
  resource :assignments, only: [:show, :new, :create, :index, :udated]

  root to: "home#show"
end
