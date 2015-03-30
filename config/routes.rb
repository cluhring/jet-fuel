Rails.application.routes.draw do
  resources :urls
  resources :welcome, only: [:index, :create]
  root "welcome#index"
  get ':tiny_url' => 'urls#show'
  namespace :api do
    namespace :v1 do
      resources :urls
    end
  end
end
