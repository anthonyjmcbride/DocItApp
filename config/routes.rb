Rails.application.routes.draw do
  root 'events#index'
  get '/search', to: 'events#index', as: 'search'
  resources :events

end
