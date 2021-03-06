Rails.application.routes.draw do
  get 'favorite/index'

  root to: 'static_pages#home'
  get    'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  

  resources :users do
    member do
      get :followings, :followers, :favorites
    end
  end
  
  resources :relationships, only: [:create, :destroy]
 
  

  resources :microposts do
     resource :favorites, only: [:create, :destroy]
  end
end