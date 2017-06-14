Rails.application.routes.draw do
  root 'events#index'
  get '/search', to: 'event_brite_api#show', as: 'search'

end
