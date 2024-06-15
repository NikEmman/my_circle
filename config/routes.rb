Rails.application.routes.draw do
  root 'posts#index'
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :followees_followers, only: :destroy
  resources :posts do
    resources :liker_liked_posts, only: %i[create destroy]
    resources :comments, except: :index do
      resources :liker_liked_comments, only: %i[create destroy]
    end
  end
  devise_for :users, controllers: { registrations: 'my_registrations' }
  resources :profiles, except: %i[index destroy] do
    resources :follow_requests, only: %i[create update]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
