Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :events do
    resources :comments, shallow: true, only: [:create, :destroy]
    resources :tickets, shallow: true, only: [:new, :create]
  end

  resources :nearby_events, only: [:index]

  resources :discounts

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create] do
      delete :destroy, on: :collection
  end
  namespace :admin, defaults: {format: :json} do
    resources :dashboard, only: [:index]
  end
  namespace :api do
   namespace :v1 do
     resources :events, only: [:index, :show, :create]
   end
 end

  root 'home#index'
end
