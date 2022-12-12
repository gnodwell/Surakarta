class Cell
    @x = -1
    @y = -1
    @contains = nil
    @loops = nil

    def initialize(x, y, contains)
        @x = x
        @y = y
        @contains = contains
    end
    

    def replacePiece(piece)
        @contains = piece
    end
    

    def contains?
        @contains
    end

    def x?
        @x
    end

    def y?
        @y
    end
end