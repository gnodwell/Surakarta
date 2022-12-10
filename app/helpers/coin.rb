class Coin
  # Initialize the class with a random "face" (either "heads" or "tails")
  def initialize
    @face = [:H, :T].sample
  end

  # Flip the coin by randomly choosing a new face
  def flip
    @face = [:H, :T].sample
  end

  # Return the current face of the coin
  def face
    @face
  end
end
  