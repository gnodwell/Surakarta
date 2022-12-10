class Piece

    #colours are only :black or :white
    @colour = nil
    @captured = false

    def initialize(colour)
        @colour = colour
    end

    def setCaptured() 
        @captured = true   
    end

    def getColour() 
        @colour
    end

end