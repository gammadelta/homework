GoogleAuthExample::Application.routes.draw do
  get "assignments/new"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'post', to:'assignments#new'
  get 'profile', to: 'sessions#show'
  get 'edit', to: 'sessions#edit'

  resource :sessions, only: [:show, :edit, :delete, :create]
  resource :home, only: [:show]
  resources :assignments

  root to: "home#show"
end
