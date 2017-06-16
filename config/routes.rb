Rails.application.routes.draw do
  root 'events#index'
  get '/events/:id' => 'events#show'
  get '/search', to: 'events#index', as: 'search'
  resources :events

end
