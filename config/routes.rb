Rails.application.routes.draw do
  resources :urls, only: [:index, :show]
  resources :welcome, only: [:index, :create]
  resources :users, only: [:new, :create]
  root "welcome#index"
  get ':tiny_url' => 'urls#show'
  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
end
