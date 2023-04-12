Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  root to: "home#index"

  resources :users do
    resources :posts do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
  end

  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/signup", to: "devise/registrations#new"
  end
end
