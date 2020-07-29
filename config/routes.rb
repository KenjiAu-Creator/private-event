Rails.application.routes.draw do
  resources :events
  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/login'
  # get 'sessions/welcome'

  get    'login'  => 'sessions#new'
  post   'login'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :sessions
  resources :users
  resources :invitations

  root "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
