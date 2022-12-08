Rails.application.routes.draw do
  root "game#index"

  get "/queue_page", to: 'game#queue_page'
  get "/game_page", to: 'game#game_page'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server => "/cable"
end
