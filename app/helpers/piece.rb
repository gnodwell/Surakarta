class Piece
    # Enum for piece colors
    Color = [:black, :white]
    @captured = false
    attr_reader :captured
  
    # Initialize a new Piece with the specified color and captired state
    def initialize(color, captured = false)
      @color = if color == :black then Color[0] else Color[1] end
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
  

print("Testing the Piece class\n")
piece = Piece.new(:black)
# test get color
puts("Piece color: ")
puts(piece.getColor)
piece.setCaptured
puts("Captured: ")
puts(piece.captured)
