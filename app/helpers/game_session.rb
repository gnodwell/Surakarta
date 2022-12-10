require './board.rb'

class GameSession < ApplicationRecord
  ### Stuff for data model
  # belongs_to :SessionHost
  # has_many :players
  # has :board

  def createGameSession()
    # is this supposed to be the constructor? Constructors can only be called initialize in ruby...

    @board = Board.new()
    
    # @board.createBoard() # not sure if this how a board is supposed to be initialized
  end

  def getResults()
    # no given way to implement this in given documentation, so...

    # returns winner and loser in player array
    player_result = []
    for player in @SessionHost.get_players # will need SessionHost to store list of players, and have a method to retrieve them
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