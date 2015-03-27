Rails.application.routes.draw do
  resources :emails
  resources :welcome, only: [:index]
  root "welcome#index"
end
