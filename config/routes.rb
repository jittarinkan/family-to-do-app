Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :dashboard, only: :index
  resources :family_members, only: [:new, :create] do
    resources :tasks, module: :family_members
  end
  resources :tasks

  root "dashboard#index"
end
