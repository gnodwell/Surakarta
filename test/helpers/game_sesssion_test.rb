require "test_helper"

class CoinTest < ActiveSupport::TestCase
  def test_create_game
    game = GameSession.new
    assert game.exists?, "Game could not be created"
    game2 = game.restartGame()
    assert game2 != game, "Game could not be restarted"
  end
end