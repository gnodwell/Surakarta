require_relative 'cell'
require_relative 'piece'
require_relative 'path_map'

MAX_SIZE = 5
MIN_SIZE = 0

class Board
    @size = 36 # I think size means number of points on the board
    @boardState = nil

    # THIS METHOD FOR TESTING PURPOSES ONLY
    def getCell(x, y)
        return @boardState[x][y]
    end

    def initialize
        @boardState = Array.new(6){Array.new(6)}
        #Init the boardState
        (MIN_SIZE..MAX_SIZE).each do |y| #i
            (MIN_SIZE..MAX_SIZE).each do |x| #j
                #populate the 6x6 array with cells

                #Init white pieces in cells on the top two rows
                if y == 0 or y == 1
                    piece = Piece.new(:white)
                    @boardState[x][y] = Cell.new(x, y, piece)

                #Init black pieces in cells on the bottom two rows
                elsif y == 4 or y == 5
                    piece = Piece.new(:black)
                    @boardState[x][y] = Cell.new(x, y, piece)

                #Init empty cells in the middle rows
                else
                    @boardState[x][y] = Cell.new(x, y, nil)
                end
            end
        end
    end

    # --------------------- PUBLIC METHODS ---------------------
    def validateWin()
        blackExists = false
        whiteExists = false

        (MIN_SIZE..MAX_SIZE).each do |i|
            (MIN_SIZE..MAX_SIZE).each do |j|

                #Check if the cell is not empty
                if @boardState[i][j].contains? != nil

                    #Check if black exists in this position
                    if @boardState[i][j].contains?.getColour == :black
                        blackExists = true

                        #If white exists, return false since both colours exist
                        if whiteExists
                            return false
                        end

                    #Check if white exists in this position
                    elsif @boardState[i][j].contains?.getColour == :white
                        whiteExists = true

                        #If black exists, return false since both colours exist
                        if blackExists
                            return false
                        end
                    end
                end
            end
        end

        #return true if at least one colour does not exist
        return true
    end

    def move(current_cell, target_cell, colour)

        if validateMove(current_cell, target_cell, colour) == false
            return false
        end

        target_cell.replacePiece(current_cell.contains?)
        current_cell.replacePiece(nil)
        return true
    end

    def capture(cur_cell, target_cell)
        #Check if there's the correct pegs in the cur_cell and target_cell

        if validateCapture(cur_cell, target_cell)
            target_cell.replacePiece(cur_cell.contains?)
            cur_cell.replacePiece(nil)
            return true
        else
            return false
        end
    end

    # --------------------- PRIVATE METHODS ---------------------
    private

    #Not sure how to implement this since there's no arguments
    def validateMove(current_cell, target_cell, colour)

        if current_cell.contains? == nil
            return false
        end

        if colour != current_cell.contains?.getColour
            return false
        end

        #Validating if positions exist on the board
        if current_cell.x? < MIN_SIZE or current_cell.x? > MAX_SIZE or current_cell.y? < MIN_SIZE or current_cell.y? > MAX_SIZE
            return false
        end

        if target_cell.x? < MIN_SIZE or target_cell.x? > MAX_SIZE or target_cell.y? < MIN_SIZE or target_cell.y? > MAX_SIZE
            return false
        end
        
        #Validate that current pos has a a piece and target does not
        if current_cell.contains? == nil
            return false
        end

        if target_cell.contains? != nil
            return false
        end

        #Validating the positions are within one of each other, if so, make the move
        x_diff = current_cell.x? - target_cell.x?
        y_diff = current_cell.y? - target_cell.y?

        if (x_diff).abs <= 1 and (y_diff).abs <= 1
            return true
        end

        return false
    end



    #Not sure how to implement this since there's no arguments
    def validateCapture(cur_cell, target_cell)

        #Validate the two cells have pieces in them
        if cur_cell.contains? == nil or target_cell.contains? == nil
            return false
        end

        #Validate the two pieces are of different colours
        if cur_cell.contains?.getColour == target_cell.contains?.getColour
            return false
        end

        #Check if the current cell is in one of the corners
        if cur_cell.x? == 0 or cur_cell.x? == 5
            if cur_cell.y? == 0 or cur_cell.y? == 5
                return false
            end
        end

        #check if the target cell is in one of the corners
        if target_cell.x? == 0 or target_cell.x? == 5
            if target_cell.y? == 0 or target_cell.y? == 5
                return false
            end
        end

        if moveUp(cur_cell, cur_cell, target_cell, false)
            return true
        elsif moveDown(cur_cell, cur_cell, target_cell, false)
            return true
        elsif moveLeft(cur_cell, cur_cell, target_cell, false)
            return true
        elsif moveRight(cur_cell, cur_cell, target_cell, false)
            return true
        else
            return false
        end
    end


    #make the move up, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveUp(cur_cell, start_cell, target_cell, hasTraversedLoop)

        #Check if the current cell is at the top
        if cur_cell.y? == 0
            #Check if the peg can go through a loop
            newCell = getLoopEnd(cur_cell)

            #Check if the loop exists
            if newCell == nil
                return false
            end

            hasTraversedLoop = true

            #Check if the new position is the start_cell, target_cell, or another piece
            if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                return false
            elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                return true
            elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                return false
            end

            #Call the next method on it recursively
            if newCell.x? == 0
                return moveRight(newCell, start_cell, target_cell, hasTraversedLoop)
            elsif newCell.x? == 5
                return moveLeft(newCell, start_cell, target_cell, hasTraversedLoop)
            else
                print("BAD, SHOULD NOT BE HERE")
                return false
            end

        else
            #Making the move up
            newCell = Cell.new(cur_cell.x?, cur_cell.y? - 1, nil)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveUp(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move down, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveDown(cur_cell, start_cell, target_cell, hasTraversedLoop)

        #Check if the current cell is at the bottom
        if cur_cell.y? == 5
            #Check if the peg can go through a loop
            newCell = getLoopEnd(cur_cell)

            #Check if the loop exists
            if newCell == nil
                return false
            end

            hasTraversedLoop = true

            #Check if the new position is the start_cell, target_cell, or another piece
            if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                return false
            elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                return true
            elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                return false
            end

            #Call the next method on it recursively
            if newCell.x? == 0
                return moveRight(newCell, start_cell, target_cell, hasTraversedLoop)
            elsif newCell.x? == 5
                return moveLeft(newCell, start_cell, target_cell, hasTraversedLoop)
            else
                print("BAD, SHOULD NOT BE HERE")
                return false
            end

        else
            #Making the move down
            newCell = Cell.new(cur_cell.x?, cur_cell.y? + 1, nil)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move right, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveRight(cur_cell, start_cell, target_cell, hasTraversedLoop)


        #Check if the current cell is at the most rigt position
        if cur_cell.x? == 5
            #Check if the peg can go through a loop
            newCell = getLoopEnd(cur_cell)

            #Check if the loop exists
            if newCell == nil
                return false
            end

            hasTraversedLoop = true

            #Check if the new position is the start_cell, target_cell, or another piece
            if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                return false
            elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                return true
            elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                return false
            end

            #Call the next method on it recursively
            if newCell.y? == 0
                return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
            elsif newCell.y? == 5
                return moveUp(newCell, start_cell, target_cell, hasTraversedLoop)
            else
                print("BAD, SHOULD NOT BE HERE")
                return false
            end

        else
            #Making the move right
            newCell = Cell.new(cur_cell.x? + 1, cur_cell.y?, nil)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if @boardState[newCell.x?][newCell.y?].contains?  != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move left, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveLeft(cur_cell, start_cell, target_cell, hasTraversedLoop)

        #Check if the current cell is at the bottom
        if cur_cell.x? == 0
            #Check if the peg can go through a loop
            newCell = getLoopEnd(cur_cell)

            #Check if the loop exists
            if newCell == nil
                return false
            end

            hasTraversedLoop = true

            #Check if the new position is the start_cell, target_cell, or another piece
            if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                return false
            elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                return true
            elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                return false
            end

            #Call the next method on it recursively
            if newCell.y? == 0
                return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
            elsif newCell.y? == 5
                return moveUp(newCell, start_cell, target_cell, hasTraversedLoop)
            else
                print("BAD, SHOULD NOT BE HERE")
                return false
            end

        else
            #Making the move left
            newCell = Cell.new(cur_cell.x? - 1, cur_cell.y?, nil)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if @boardState[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end


    def getLoopEnd(cell)

        #get all path maps find if the current cell has a path to another cell through a loop
        pathMaps = pathMaps()
        pathMaps.each do |pathMap|
          if cell.x? == pathMap.instance_variable_get(:@startCellId).x?
            if cell.y? == pathMap.instance_variable_get(:@startCellId).y?
              return  pathMap.instance_variable_get(:@endCellId)
            end
          end
        end
        return nil
    end


    #HELPER
    def pathMaps
        maps = []
        (MIN_SIZE..MAX_SIZE).each do |x|
            (MIN_SIZE..MAX_SIZE).each do |y|

                if x == 0
                    if y == 1
                        startCell = Cell.new(0, 1, nil)
                        endCell = Cell.new(1, 0, nil)

                    elsif y == 2
                        startCell = Cell.new(0, 2, nil)
                        endCell = Cell.new(2, 0, nil)

                    elsif y == 3
                        startCell = Cell.new(0, 3, nil)
                        endCell = Cell.new(3, 0, nil)

                    elsif y == 4
                        startCell = Cell.new(0, 4, nil)
                        endCell = Cell.new(4, 0, nil)
                        
                    end
                elsif x == 1
                    if y == 0
                        startCell = Cell.new(1, 0, nil)
                        endCell = Cell.new(0, 1, nil)

                    elsif y == 5
                        startCell = Cell.new(1, 5, nil)
                        endCell = Cell.new(0, 4, nil)
                        
                    end
                elsif x == 2
                    if y == 0
                        startCell = Cell.new(2, 0, nil)
                        endCell = Cell.new(0, 2, nil)
                        
                    elsif y == 5
                        startCell = Cell.new(2, 5, nil)
                        endCell = Cell.new(0, 3, nil)

                    end
                elsif x == 3
                    if y == 0
                        startCell = Cell.new(3, 0, nil)
                        endCell = Cell.new(5, 2, nil)
                        
                    elsif y == 5
                        startCell = Cell.new(3, 5, nil)
                        endCell = Cell.new(5, 3, nil)
                        
                    end
                elsif x == 4
                    if y == 0
                        startCell = Cell.new(4, 0, nil)
                        endCell = Cell.new(5, 3, nil)
                        
                    elsif y == 5
                        startCell = Cell.new(4, 5, nil)
                        endCell = Cell.new(5, 4, nil)
                        
                    end
                elsif x == 5
                    if y == 1
                        startCell = Cell.new(5, 1, nil)
                        endCell = Cell.new(4, 0, nil)
                        
                    elsif y == 2
                        startCell = Cell.new(5, 2, nil)
                        endCell = Cell.new(3, 0, nil)
                        
                    elsif y == 3
                        startCell = Cell.new(5, 3, nil)
                        endCell = Cell.new(3, 5, nil)
                        
                    elsif y == 4
                        startCell = Cell.new(5, 4, nil)
                        endCell = Cell.new(4, 5, nil)
                        
                    end
                end

                if startCell != nil
                    pathMap = PathMap.new()
                    pathMap.startCellId = startCell
                    pathMap.endCellId = endCell
                    pathMap.save
                    maps.push(pathMap)
                end
            end
        end

        return maps
    end
end



