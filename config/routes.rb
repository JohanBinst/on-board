Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root "trips#index"
  resources :trips, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
  get 'trips/user/:user_id', to: 'trips#my_trips', as: :my_trips
  resources :bookings, only: [:show, :index, :edit]

end
