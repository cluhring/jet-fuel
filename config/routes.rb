Rails.application.routes.draw do
  resources :urls
  resources :welcome, only: [:index]
  root "welcome#index"
end
