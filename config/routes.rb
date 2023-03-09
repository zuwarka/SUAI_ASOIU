Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "home#index"
  devise_scope :user do
    get 'users/sign_out' => 'devise/session#destroy'
  end

  root 'pages#index'
  # add root get search to entity#search
  get 'search', to: 'trips#search'
  resources :companies,
            :passengers,
            :service_types,
            :tickets,
            :train_types,
            :trips

  namespace :admin do
    get 'dashboard', to: 'pages#dashboard'
    get 'board', to: 'types#board'
    resources :employees,
              :passengers,
              :positions,
              :tickets,
              :trips
  end

  unauthenticated :users do
    namespace :admin do
      root to: 'session#new', as: :unauthenticated_root
    end
  end
end
