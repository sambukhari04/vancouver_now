Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :events

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end
  namespace :admin do
    resources :dashboard, only: [:index]
  end

  root 'home#index'
end
