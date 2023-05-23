Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      resources :categories do
        member do
          get 'products'
        end
      end
      resource :shopping_carts, only: %i[show update destroy] do
        member do
          post 'checkout'
        end
      end
      resources :products
      resources :orders, only: %i[index show]
    end
  end
end
