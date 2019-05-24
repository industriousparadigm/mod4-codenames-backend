Rails.application.routes.draw do
  resources :players
  resources :words
  resources :games

  post 'sign_in', to: 'players#sign_in'
  post 'activate', to: 'players#sign_in'

  get 'start', to: 'games#start'
end
