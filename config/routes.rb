Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "family_members#index"

  resources :family_members, only: [:index, :show, :new, :create]
end
