Rails.application.routes.draw do

  root 'locations#index'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'

  resources :locations do
    resources :events
  end

  resources :users
end
