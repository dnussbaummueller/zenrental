Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :yoga_studios do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:index, :show, :destroy]

  get "bookings/accept/:id", to: "bookings#accept", as: :accept_booking
  get "bookings/reject/:id", to: "bookings#reject", as: :reject_booking
  ##############################
  # Routes without resources as a reference.
  ##############################

  # # As a user I can see all yoga studios
  # get "yoga_studios", to: "yoga_studios#index"
  # # As a user I can create a yoga studio
  # get "yoga_studios/new", to: "yoga_studios#new"
  # post "yoga_studios", to: "yoga_studios#create"
  # # As a user I can see the details of one yoga studio
  # get "yoga_studios/:id", to: "yoga_studios#show", as: :yoga_studio
  # # As a user I can send a booking request for a yoga studio
  # post "yoga_studios/:id/bookings", to: "bookings#create"
  # # As a user I can confirm or reject a booking request for my yoga studio
  # # patch "yoga_studios/:id/bookings/:booking_request_id", to: "bookings#update"

  # # As a user I can delete a yoga studio
  # delete "yoga_studios/:id", to: "yoga_studios#destroy"
  # # As a user I can edit a yoga studio
  # get "yoga_studios/:id/edit", to: "yoga_studios#edit"
  # patch "yoga_studios/:id", to: "yoga_studios#update"

  # # As a user I can see all my booking requests
  # get "bookings", to: "bookings#index"
  # # As a user I can see the details of one booking request
  # get "bookings/:id", to: "bookings#show", as: :booking_request
  # # As a user I can delete a booking request
  # delete "bookings/:id", to: "bookings#destroy"
end
