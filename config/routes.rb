Rails.application.routes.draw do
  get 'system_settings', to: 'settings#system_settings'
  resources :partners
  resources :partner_types
  resources :organization_units
  resources :organization_types
  resources :posts
  
  get "home/index"

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Only one Devise block
  devise_for :users,
    controllers: {
      sessions: "users/sessions",
      registrations: "users/registrations",
      passwords: "users/passwords",
      confirmations: "users/confirmations"
    }
  scope "/admin" do
    resources :users do
      member do
        get :confirm
      end
      collection do
        get :load_users
        get :load_professions
      end
    end
  end

  resources :users
  root "home#index"
end
