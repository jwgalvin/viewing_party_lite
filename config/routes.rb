Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/register', to: 'users#new'
  post '/register', to: 'users#create'

  resources :users, only: [:show, :create] do
    resources :discover, only: [:index]
  end
end
