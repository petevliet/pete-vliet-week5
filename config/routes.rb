Rails.application.routes.draw do

  root 'locations#index'
  
  resources :locations do
    resources :events
  end
end
