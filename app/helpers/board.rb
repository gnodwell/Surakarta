require_relative 'cell'
require_relative 'piece'

MAX_SIZE = 5
MIN_SIZE = 0

class Board
    @size = 36 # I think size means number of points on the board
    @boardState = nil

    # FOR TESTING PURPOSES ONLY
    def getCell(i, j)
        return @boardState[i][j]
    end


    def initialize()
        @boardState = Array.new(6){Array.new(6)}
        #Init the boardState
        (MIN_SIZE..MAX_SIZE).each do |i|
            (MIN_SIZE..MAX_SIZE).each do |j|
                #populate the 6x6 array with cells

                #Init black pieces in cells on the top two rows
                if i == MIN_SIZE or i == 1
                    piece = Piece.new(:black)
                    @boardState[i][j] = Cell.new(i, j, piece)
                    #@boardState.at(i).push(Cell.new(i, j, piece))

                #Init white pieces in cells on the bottom two rows
                elsif i == 4 or i == MAX_SIZE
                    piece = Piece.new(:white)
                    @boardState[i][j] = Cell.new(i, j, piece)

                #Init empty cells in the middle rows
                else
                    @boardState[i][j] = Cell.new(i, j, nil)
                end

                #print(@board.at(i).class, "\n")
                #print(@board.at(i).at(j).class, "\n")

                # TO DO: NEEDS TO ESTABLISH THE LOOPS
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

        if colour != current_cell.contains?.getColour
            return false
        end

        if not validateMove(current_cell, target_cell, colour)
            return false
        end

        target_cell.replacePiece(current_cell.contains?)
        current_cell.replacePiece(nil)
        return true
    end

    def capture(cur_cell, target_cell, colour)
        #Check if there's the correct pegs in the cur_cell and target_cell

        if validateCapture(cur_cell, target_cell, colour)
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
        #Validating if positions exist on the board
        if current_cell.x? < MIN_SIZE or current_cell.x? > MAX_SIZE or current_cell.y? < MIN_SIZE or current_cell.y? > MAX_SIZE
            return false
        end

        if target_cell.x? < MIN_SIZE or target_cell.x? > MAX_SIZE or target_cell.y? < MIN_SIZE or target_cell.y? > MAX_SIZE
            return false
        end

        #Validate that current pos has a a piece and target does not
        if not current_cell.contains?
            return false
        end

        if target_cell.contains?
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
    def validateCapture(cur_cell, target_cell, colour)
        if @boardState[cur_cell.x?][cur_cell.y?].contains? == nil or @boardState[cur_cell.x?][cur_cell.y?].contains?.getColour != colour
            return false
        elsif @boardState[target_cell.x?][target_cell.y?].contains? == nil or @boardState[target_cell.x?][target_cell.y?].contains?.getColour == colour
            return false
        end

        #Check if the current cell is in one of the corners
        if cur_cell.x? == 0 or cur_cell.x? == 5
            if cur_cell.y == 0 or cur_cell.y == 5
                return false
            end
        end

        #check if the target cell is in one of the corners
        if target_cell.x? == 0 or target_cell.x? == 5
            if target_cell.y == 0 or target_cell.y == 5
                return false
            end
        end

        if moveUp(cur_cel, cur_cel, target, false)
            return true
        elsif moveDown(cur_cel, cur_cel, target, false)
            return true
        elsif moveLeft(cur_cel, cur_cel, target, false)
            return true
        elsif moveRight(cur_cel, cur_cel, target, false)
            return true
        else
            return false
        end
    end


    #make the move up, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveUp(cur_cel, start_cell, target_cell, hasTraversedLoop)

        #Check if the current cell is at the top
        if cur_cell.y? == 0
            #Check if the peg can go through a loop
            newCell = checkLoop(cur_cell, target_cell)

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
            elsif board[newCell.x?][newCell.y?].contains? != nil
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
            newCell = Cell.new(cur_cell.x?, y - 1)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveUp(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move down, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveDown(cur_cel, start_cell, target_cell)

        #Check if the current cell is at the bottom
        if cur_cell.y? == 5
            #Check if the peg can go through a loop
            newCell = checkLoop(cur_cell, target_cell)

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
            elsif board[newCell.x?][newCell.y?].contains? != nil
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
            newCell = Cell.new(cur_cell.x?, y + 1)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move right, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveRight(cur_cel, start_cell, target_cell)


        #Check if the current cell is at the most rigt position
        if cur_cell.x? == 5
            #Check if the peg can go through a loop
            newCell = checkLoop(cur_cell, target_cell)

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
            elsif board[newCell.x?][newCell.y?].contains? != nil
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
            newCell = Cell.new(x + 1, cur_cell.y?)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if board[newCell.x?][newCell.y?].contains?  != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end

    #make the move left, or through a loop, then check if it's a colision. If it's not, recursively all another funtion
    def moveLeft(cur_cel, start_cell, target_cell)

        #Check if the current cell is at the bottom
        if cur_cell.x? == 0
            #Check if the peg can go through a loop
            newCell = checkLoop(cur_cell, target_cell)

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
            elsif board[newCell.x?][newCell.y?].contains? != nil
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
            newCell = Cell.new(x - 1, cur_cell.y?)

            if hasTraversedLoop
                #Checking if there's a colision
                if newCell.x? == start_cell.x? and newCell.y? == start_cell.y?
                    return false
                elsif newCell.x? == target_cell.x? and newCell.y? == target_cell.y?
                    return true
                elsif board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end

            else
                if board[newCell.x?][newCell.y?].contains? != nil
                    return false
                end
            end

            return moveDown(newCell, start_cell, target_cell, hasTraversedLoop)
        end
    end



    def getLoopEnd(cell)

        #get all path maps find if the current cell has a path to another cell through a loop
        pathMaps = PathMap.all()
        pathMaps.each do |pathMap|
          if cell.x? == pathMap.instance_variable_get(:@startCellId).x?
            if cell.y? == pathMap.instance_variable_get(:@startCellId).y?
              return  pathMap.instance_variable_get(:@endCellId)
            end
          end
        end
        return nil
      end
end



