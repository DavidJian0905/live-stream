Rails.application.routes.draw do
  devise_for :users

  resources :videos, only: [:index, :show, :new, :create, :destroy]
  get '/watch/:id', to: 'users#watch', as: :watch
  get '/stream', to: 'users#stream', as: :stream

  root 'home#home'
end
