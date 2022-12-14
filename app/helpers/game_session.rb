require_relative 'board.rb'

class Game_Session < ApplicationRecord
  ### Stuff for data model
  # belongs_to :SessionHost
  # has_many :players
  # has :board

  def initialize()
    # is this supposed to be the constructor? Constructors can only be called initialize in ruby...

    @board = Board.new()
    # @SessionHost = session # would need some way to keep track of the session host that created the instance of this game session
  end

  def getResults()
    # no given way to implement this in given documentation, so...

    ### Below is the only way I could think of to get the winner and loser using the given documentation
    ### this however would not be implementing the design as specified in the documentation
    if @board.validateMove
    end

    player_result = []

    host = SessionHost.find_by(game_session_id: self.id) 

    for player in host.get_players # will need SessionHost to store list of players, and have a method to retrieve them
      if player.piece_count == 0 # player will need a method to return the number of pieces they have
        player_result.push(player)
      elsif player.piece_count > 0 && player_result.length() > 0
        player_result.push(player)
      end
    end
    return player_result
  end

  def restartGame()
    @board = Board.new()
    
    # need some way to update the view
  end
end