Rails.application.routes.draw do
  root to: "pages#home"

  ##############################
  # Routes without resources as a reference
  ##############################

  # As a user I can see all yoga studios
  get "yoga_studios", to: "yoga_studios#index"
  # As a user I can create a yoga studio
  get "yoga_studios/new", to: "yoga_studios#new"
  post "yoga_studios", to: "yoga_studios#create"
  # As a user I can see the details of one yoga studio
  get "yoga_studios/:id", to: "yoga_studios#show", as: :yoga_studio
  # As a user I can send a booking request for a yoga studio
  post "yoga_studios/:id/bookings", to: "bookings#create"
  # As a user I can confirm or reject a booking request for my yoga studio
  patch "yoga_studios/:id/bookings/:booking_request_id", to: "bookings#update"

  # As a user I can delete a yoga studio
  delete "yoga_studios/:id", to: "yoga_studios#destroy"
  # As a user I can edit a yoga studio
  get "yoga_studios/:id/edit", to: "yoga_studios#edit"
  patch "yoga_studios/:id", to: "yoga_studios#update"

  # As a user I can see all my booking requests
  get "bookings", to: "bookings#index"
  # As a user I can see the details of one booking request
  get "bookings/:id", to: "bookings#show", as: :booking_request
  # As a user I can delete a booking request
  delete "bookings/:id", to: "bookings#destroy"

  # As a user I can filter the yoga studios on the index page
  get "yoga_studios/filter", to: "yoga_studios#filter"

  ##############################
  # Routes with resources
  ##############################

  # Define RESTful routes for yoga studios and bookings
  resources :yoga_studios do
    resources :bookings, only: [:create, :update]
  end
  resources :bookings, only: [:index, :show, :destroy]

  # Add a path helper to generate a URL for filtered yoga studios
  get "yoga_studios/filter", to: "yoga_studios#index", as: :filtered_yoga_studios
end
