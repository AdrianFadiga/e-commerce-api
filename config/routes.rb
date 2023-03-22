Rails.application.routes.draw do
  namespace :api do
    mount_devise_token_auth_for 'User', at: 'auth'
    namespace :v1 do
      resources :categories do
        member do
          get 'products'
        end
      end
      resource :shopping_carts, only: %i[show update destroy], path: 'shopping_carts'
      resources :products
    end
  end
end
