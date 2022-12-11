Rails.application.routes.draw do
  resources :messages
  resources :users
  root "users#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create'    => 'game#create'
  resources :game
  mount ActionCable.server => "/cable"
end
