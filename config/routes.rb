Rails.application.routes.draw do
 
  get 'myprofile', to: "users#show"
  patch 'myprofile', to: "users#update"

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :events
    resources :users
    match ':id/accept', :to => 'dashboard#accept', :as => 'accept', :via => :post
    match ':id/refuse', :to => 'dashboard#refuse', :as => 'refuse', :via => :post
  end
  
  
  resources :events do
    resources :charges, only: [:new, :create]
    resources :attendance, only: [:create, :destroy]
  end

  resources :avatars, only: [:create]

  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"

end
