Rails.application.routes.draw do
  resources :urls
  resources :welcome, only: [:index, :create]
  root "welcome#index"
end
