Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/signup' => 'users#new'
  post 'signup' => 'users#create'

  get 'login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/user/most_destinations' => 'users#most_destinations', as: :most_destinations
  get '/destinations/five_star' => 'destinations#five_star', as: :five_star
  get '/cities/most_visited' => 'cities#most_visited', as: :most_visited
  get '/cities/highly_rated' => 'cities#highly_rated', as: :highly_rated

  resources :users do
    resources :trips
  end

  resources :cities, only: [:index, :show, :new, :create]
  resources :countries, only: [:index, :show]
  
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
