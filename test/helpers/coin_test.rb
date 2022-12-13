require_relative '../../app/helpers/coin'

class CoinTest
  def test_flip
    flipper = Coin.new
    puts "Running Coin Test..."
    puts "Flipping the coin 1000 times..."
    head = 0
    tails = 0
    1000.times do
      result = flipper.flip
      if result != :H && result != :T
        puts "Unexpected result: #{result}"
        puts "Coin Test failed"
        break
      end
      if result == :H
        head += 1
      elsif result == :T
        tails += 1
      end
    end
    puts "Heads was up #{head} times"
    puts "Tails was up #{tails} times"
    puts "Coin Test Passed"
  end
end

coinTest = CoinTest.new
coinTest.test_flip()