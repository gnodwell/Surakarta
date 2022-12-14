Rails.application.routes.draw do
  resources :messages
  resources :users
  resources :board

  get '/users', to: "users#index"
  root "game#index"

  get "/queue_page", to: 'game#queue_page'
  get "/game_page", to: 'game#game_page', as: 'game_path'

  post "/queue", to: 'session#create'
  # post "/game_page", to: 'board#create'

  post "/move", to: "board#move"

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create'    => 'game#create'
  resources :game
  mount ActionCable.server => "/cable"
end
