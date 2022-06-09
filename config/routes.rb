Rails.application.routes.draw do
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  devise_for :users
  scope '/admin' do
    resources :users
  end

  resources :roles
  # resources :users

  root to: 'pages#home'
end
