AquariumApp::Application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :aquaria do
    resources :chemistries
    resources :inhabitants
    resources :water_types
  end

  root to: "welcome#index"
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
