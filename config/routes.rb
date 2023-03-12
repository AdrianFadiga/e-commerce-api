Rails.application.routes.draw do
  resources :products
  namespace :api do
    namespace :v1 do
      resources :categories
    end
  end
end
