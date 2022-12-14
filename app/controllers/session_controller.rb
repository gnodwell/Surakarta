require_relative '../helpers/player'
require_relative '../helpers/session_host'

class SessionController < ApplicationController
 
    def create 
        player = Player.new(params[:name])
        session = Session_host.new()
    end 
end