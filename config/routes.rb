Rails.application.routes.draw do
 
  get 'myprofile', to: "users#show"
  resources :events do
    resources :charges, only: [:new, :create]
    resources :attendance, only: [:create, :destroy]
  end
  
  

  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"

end
