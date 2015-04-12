Rails.application.routes.draw do
  #root
  resources :welcome, only: [:index, :create]
  root "welcome#index"
  #users
  resources :users, only: [:new, :create]
  #url info
  resources :urls, only: [:index, :show]
  #tiny_url_slug
  get ':tiny_url' => 'urls#show'
  #sessions for 2factorauthentication
  resources :sessions, only: [:new, :create]
  get "sessions/destroy"
  get "sessions/two_factor"
  post "sessions/verify"
  post "sessions/resend"
  # User account section for 2factorauthentication
  # resources :accounts, only: [:show]
  #api
  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
end
