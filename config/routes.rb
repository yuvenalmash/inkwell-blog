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

  namespace :api do
    namespace :v1 do
      resources :users, only: %i[index show] do
        resources :posts, only: %i[index create show update destroy] do
          resources :comments, only: %i[create show update destroy]
          resources :likes, only: %i[create destroy]
        end
      end
    end
  end
end
