require_relative '../helpers/player'

class SessionController < ApplicationController
 
    def create 
        player = Player.new(params[:name])
    end 
end