Rails.application.routes.draw do
  root 'feed#index'
  get 'feed/index'
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    #  get 'users/:id', to: 'users/registrations#show', as: 'user'
  end
  resources :posts do
    resources :comments
  end
  devise_for :users

  resources :profile, only: %i[show create edit]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
