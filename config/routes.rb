Rails.application.routes.draw do
  get 'profiles/set_preferences'
  devise_for :users
  # root to: "pages#home"
  root "trips#index"
  resources :trips, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
  get 'trips/user/:user_id', to: 'trips#my_trips', as: :my_trips
  resources :bookings, only: [:show, :index, :edit]
  get 'set_preferences', to: 'profiles#set_preferences', as: :set_preferences
  resources :profiles, only:[:update]
end
