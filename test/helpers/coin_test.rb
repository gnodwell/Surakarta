require 'test_helper'

class CoinTest < ActiveSupport::TestCase
  def test_flip
    flipper = Coin.new
    1000.times do
      result = flipper.flip
      assert result == :H || result == :T, "Unexpected result: #{result}"
    end
  end
end