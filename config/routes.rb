Rails.application.routes.draw do
  root to: "home#index"

  resources :users do
    resources :posts do
      resources :likes, only: %i[create destroy]
      resources :comments, only: %i[create destroy]
    end
  end
end
