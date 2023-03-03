Rails.application.routes.draw do
  get 'reviews/new'
  # Implement login feature
  devise_for :users

  root to: "pages#home"

  resources :yoga_studios do
    resources :reviews, only: [:new, :create]
    resources :bookings, only: [:create, :update]
  end

  resources :reviews, only: [:destroy]
  resources :bookings, only: [:index, :show, :destroy]

  # Allowing the owner of a yoga studio to accept or reject a booking
  get "bookings/accept/:id", to: "bookings#accept", as: :accept_booking
  get "bookings/reject/:id", to: "bookings#reject", as: :reject_booking

  # Creating a admin dashboard for the yoga studio owners
  get "admin", to: "yoga_studios#admin", as: :admin
end
