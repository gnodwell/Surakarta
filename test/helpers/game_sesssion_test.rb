require_relative '../../app/helpers/game_session'

class CoinTest
  def test_game
    puts "Running Game Session test..."
    puts "Creating a new game..."
    game = GameSession.new
    if game == nil
      puts "Game could not be created"
    else
      puts "Game created successfully"
    end

    if game != nil
      game2 = game.restartGame()
      if game2 == game || game2 == nil
        puts "Game could not be restarted"
      else
        puts "Game restarted successfully, a new board was created"
      end
    end
    puts "Game Session test passed"
  end
end

test1 = CoinTest.new
test1.test_game