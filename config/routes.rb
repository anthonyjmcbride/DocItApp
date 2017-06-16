Rails.application.routes.draw do
  root 'events#index'
  # get '/events/:id' => 'events#show'
  post '/events/show' => 'events#show'
  get '/search', to: 'events#index', as: 'search'
  get '/haha' => 'events#haha'
  resources :events

end
