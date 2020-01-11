Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/post/index'
  root 'post#index'
  get '/auth/google_oauth2/callback', to: 'sessions#create'

  resource :session, only: [:create, :destroy]
end
