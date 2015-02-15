Rails.application.routes.draw do

  root 'locations#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'

  resources :locations do
    resources :events
  end

  resources :users
end
