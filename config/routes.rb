VkPhotoBrowser::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  
  get '/sessions/new',      to: 'sessions#new',      as: 'new_sessions'
  get '/sessions/destroy',  to: 'sessions#destroy',  as: 'destroy_sessions'
  get '/sessions/callback', to: 'sessions#callback'

  resources :albums, only: [:index, :show]

  root 'albums#index'
end
