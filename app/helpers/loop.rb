class Loop 
    @color = []

    def initialize(cell)
      @cell = cell
    end

    def getLoopEnd(cell)
        if cell.x? == 0
            if cell.y? == 1
                return new Cell(1, 0)
            elsif cell.y? == 2
                return new Cell(2, 0)

            elsif cell.y? == 3
                return new Cell(3, 5)
            elsif cell.y? == 4
                return new Cell(4, 5)
            end
        elsif cell.x? == 1
            if cell.y? == 0
                return new Cell(0, 1)
            elsif cell.y? == 5
                return new Cell(0, 4)
            end
        elsif cell.x? == 2
            if cell.y? == 0
                return new Cell(0, 2)
            elsif cell.y? == 5
                return new Cell(0, 3)
            end
        elsif cell.x? == 3
            if cell.y? == 0
                return new Cell(5, 2)
            elsif cell.y? == 5
                return new Cell(5, 3)
            end
        elsif cell.x? == 4
            if cell.y? == 0
                return new Cell(5, 3)
            elsif cell.y? == 5
                return new Cell(5, 4)
            end
        elsif cell.x? == 5
            if cell.y? == 1
                return new Cell(4, 0)
            elsif cell.y? == 2
                return new Cell(3, 0)
            elsif cell.y? == 3
                return new Cell(3, 5)
            elsif cell.y? == 4
                return new Cell(4, 5)
            end
        else
            return nil
        end
    end
end