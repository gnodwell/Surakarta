Rails.application.routes.draw do
  resources :messages
  resources :users
  get '/users', to: "users#index"
  root "game#index"

  get "/queue_page", to: 'game#queue_page'
  #post "/queue" to: 'session_host#create'
  get "/game_page", to: 'game#game_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'create'    => 'game#create'
  resources :game
  mount ActionCable.server => "/cable"
end
