GoogleAuthExample::Application.routes.draw do
  devise_for :users, :controllers => {  :registrations => 'users/registrations' }

  #get "assignments/new", via: 'get'
  #get 'auth/:provider/callback', to: 'sessions#create'
  #get 'auth/failure', to: redirect('/')
  #get 'signout', to: 'sessions#destroy', as: 'signout'
  #get 'post-help', to:'assignments#new'
  get 'profile', to: 'users#show'
 # get 'edit', to: 'sessions#edit'
  get 'edit/:id', to: 'assignments#edit'
   get '/inbox', to: 'messages#index'
  get '/:name', to: 'subsubjects#show'


 


  #resource :sessions, only: [:show, :edit, :delete, :create]
  resource :user, only: [:edit, :show]
  resource :home, only: [:show]
  resources :assignments, only:[:show, :edit, :update, :create, :new, :destroy]
  resources :subjects, only: [:show]
  resources :subsubjects, only: [:show]
  resource :responses, only: [:create, :destroy]
  resources :messages, only: [:index, :show, :create, :destroy, :new]

  root to: "home#show"
end
