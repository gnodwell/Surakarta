class Piece
    # Enum for piece colors
    Color = Enum.new(:black, :white)
  
    # Initialize a new Piece with the specified color and captired state
    def initialize(color, captured = false)
      # Validate that the specified color is in the list of allowed colors
      raise ArgumentError, "Invalid color" unless Colors.include?(color)
  
      @color = Color[color]
      @captured = captured
    end
  
    # Set the captured state of the piece to true
    def setCaptured
      @captured = true
    end
  
    # Get the color of the piece
    def getColor
      @color
    end
end
  
