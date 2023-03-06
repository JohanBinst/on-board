Rails.application.routes.draw do
  devise_for :users
  # root to: "pages#home"
  root "trips#index"
  resources :trips, only: [:index, :show, :new, :create, :destroy] do
    resources :bookings, only: [:create]
  end
end
