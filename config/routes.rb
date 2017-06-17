Rails.application.routes.draw do
  root 'events#index'
  # get '/events/:id' => 'events#show'
  post '/events/show' => 'events#show'
  get '/search', to: 'events#index', as: 'search'
  resources :events do
    collection do
      get :dashboard
    end
  end

  
  root 'sessions#user'
  match "/auth/google_oauth2/callback" => "sessions#create", via: [:get, :post]
  # get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

end
