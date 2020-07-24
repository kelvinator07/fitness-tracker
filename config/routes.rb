Rails.application.routes.draw do
  
  authenticated :user do
    root 'activities#index', as: :authenticated_root
  end
  
  unauthenticated :user do
    root 'welcome#index', as: :unauthenticated_root
  end

  resources :activities
  # devise_for :users
  devise_for :users, path: '/', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  get 'welcome/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
