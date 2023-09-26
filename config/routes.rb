Rails.application.routes.draw do
  resources :confessions, only: [:new, :create]
  resources :replies, only: [:show]

  root 'confessions#top'
  get '/wakeup', to: 'confessions#wakeup'
end