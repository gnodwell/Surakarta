class Loop {
    # Enum for piece colors
    Color = Enum.new(:black, :white)
  
    def initialize(color, cell)
      @color = Color[color]
      @cell = cell
    end

    def getLoopEnd(cell)
        # Uses the PathMap model to get the other end of the loop given a cell, returns false if cell is not an entry to a loop
    end
}