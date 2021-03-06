WcotDashboard::Application.routes.draw do

  resources :users
  resources :resources
  resources :donations
  resources :meetings do
    resources :user_meeting_statuses
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :contributions, only: [:create, :destroy, :update, :index]

  root to: 'contributions#index'

  match '/signup',  to: 'users#new'

  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'

  match "/update_mom/:id" => 'meetings#update_mom', :as => :update_mom
end
