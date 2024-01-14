Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations',
    passwords: 'members/passwords'
  }
  resources :users do
    get :library_entry, on: :collection
    resources :entries do
      get :update_return_date, on: :member
    end
  end
  resources :books
  get 'login_members/entries', to: 'login_members#entries'
  get 'login_members/books', to: 'login_members#books'
  resources :categories
  devise_for :faculties, controllers: {
    sessions: 'faculties/sessions',
    registrations: 'faculties/registrations',
    passwords: 'faculties/passwords'
  }
  resources :staffs, only: %i[ index new create ]
  resources :libraries
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "home#index"
end
