Rails.application.routes.draw do
  resources :addresses
  resources :people

  root "people#index"
  
end
