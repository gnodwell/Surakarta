class Piece {

    #colours are only :black or :white
    @colour = nil
    @captured = false

    __init__(colour) {
        @colour = colour
    }

    def setCaptured() {
        @captured = true   
    }

    def getColour() {
        @colour
    }

}