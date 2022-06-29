Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  scope '/admin' do
    resources :users
    resources :categories
    resources :products
  end

  resources :roles
  # resources :users

  root to: 'pages#home'
  get '/productDetail/:id' => "pages#productDetail"
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  resources :products do
    resources :comments
  end
end
