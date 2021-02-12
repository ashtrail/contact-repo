Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "contacts#index"

  resources :contacts
  resources :categories
  resources :common_interests
end
