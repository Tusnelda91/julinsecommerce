Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
  get 'static_pages/about'

  get 'static_pages/contact'
  post 'static_pages/thank_you'

  get 'static_pages/index'
 
 
  root 'static_pages#landing_page'

  resources :orders, only: [:index, :show, :create, :destroy]

  get 'static_pages/landing_page'

  #devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
