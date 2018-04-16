Rails.application.routes.draw do
  resources :cart_items
  devise_for :users
  root to: 'welcome#home'

  post "/", to: "welcome#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
