Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  scope '/admin' do
    resources :users
  end

  resources :roles
  resources :users

  authenticated :user do
    root to: 'pages#home', as: :authenticated_root
  end

  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
