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
    def validateCapture
    end
end



