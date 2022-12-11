class GameController < ApplicationController
  def index
  end

  def create
    my_input = params['my_input']
    puts my_input
    ActionCable.server.broadcast("game_channel", my_input)
    render :index
  end
   
end
