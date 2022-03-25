Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: "welcome#index"
  get '/register', to: 'users#new'
  post '/register', to: 'users#create'


  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
    resources :movies, only: [:index, :show] do
      resources :parties, only: [:new, :create]
    end
  end

  get '/users/:id', to: 'users#show'
end
