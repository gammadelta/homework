GoogleAuthExample::Application.routes.draw do
  get "assignments/new"
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  get 'post', to:'assignments#new'
  get 'profile', to: 'sessions#show'
  get 'edit', to: 'sessions#edit'
  get 'edit/:id', to: 'assignments#edit'
  get '/:name', to: 'subsubjects#show'
 


  resource :sessions, only: [:show, :edit, :delete, :create]
  resource :home, only: [:show]
  resources :assignments, only:[:show, :edit, :update, :create, :new]
  resources :subjects, only: [:show]
  resources :subsubjects, only: [:show]

  root to: "home#show"
end
