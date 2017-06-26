Rails.application.routes.draw do

  resources :users
  root 'events#index'
  # get '/events/:id' => 'events#show'
  post '/events/show' => 'events#show'
  get '/search', to: 'events#index', as: 'search'


  resources :events do
    collection do
      get :dashboard
    end
  end


  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'


  root 'sessions#user'
  match "/auth/google_oauth2/callback" => "sessions#google_create", via: [:get, :post]

  get "/signout" => "sessions#destroy", :as => :signout

  # These routes will be for signup. The first renders a form in the browse, the second will
  # receive the form and create a user in our database using the data given to us by the user.
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

      # get '/redirect', to: 'example#redirect', as: 'redirect'
      # get '/callback', to: 'example#callback', as: 'callback'

end
