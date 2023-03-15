Rails.application.routes.draw do
  get 'profiles/set_preferences'
  devise_for :users
  # root to: "pages#home"
  root "trips#index"
  resources :trips, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
    # member do
    #   get :dashboard
    # end
  end
  get 'trips/user/:user_id', to: 'trips#my_trips', as: :my_trips
  resources :bookings, only: [:show, :index, :edit, :destroy] do
    resources :messages, only: [:index, :create]
  end
  get 'home', to: 'pages#home' #test moving div
  get 'set_preferences', to: 'profiles#set_preferences', as: :set_preferences
  resources :profiles, only: [:update]
end
