class PlayerController < ApplicationController

  def new
    @player = Player.new(params[:name])
  end

  def create
    @player = Player.new(params[:name])

    if @player.save
      redirect_to queue_path
    else
      redirect_to game_path
    end
  end

end