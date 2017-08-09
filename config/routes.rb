Rails.application.routes.draw do
  resources :wikis
  resources :charges, only: [:new, :create]

  # Registration controller overrides delete route for soft delete
  devise_for :users, :controllers => { :registrations => 'users/registrations' }

  root 'welcome#index'
end
