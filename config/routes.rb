Rails.application.routes.draw do
  root 'posts#index'
  # devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    #  get 'users/:id', to: 'users/registrations#show', as: 'user'
  end
  resources :followees_followers, only: :destroy
  resources :posts do
    resources :liker_liked_posts, only: %i[create destroy]
    resources :comments do
      resources :liker_liked_comments, only: %i[create destroy]
    end
  end
  devise_for :users

  resources :profiles do
    resources :follow_requests, only: %i[create update]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
