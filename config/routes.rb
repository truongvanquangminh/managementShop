Rails.application.routes.draw do
  devise_for :users
  scope '/admin' do
    resources :users
  end
  resources :roles
  resources :users
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
