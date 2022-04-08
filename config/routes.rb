Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index"
  get '/register', to: 'users#new'
  get '/login', to: 'users#login_form'
  post 'user_register', to: 'users#create'
  post '/login', to: 'users#login_user'

  get '/dashboard', to: 'users#show'
  #delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end
end
