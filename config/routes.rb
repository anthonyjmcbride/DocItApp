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

<<<<<<< HEAD
  
  root 'sessions#user'
  match "/auth/google_oauth2/callback" => "sessions#create", via: [:get, :post]
  # get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout

=======
    root 'sessions#user'
      match "/auth/google_oauth2/callback" => "sessions#create", via: [:get, :post]
      
      get "/signout" => "sessions#destroy", :as => :signout
>>>>>>> dfc2eac867d7be703f16c18d955701245c404f6c
end
