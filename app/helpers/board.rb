require 'cell.rb'
require 'piece.rb'

MAX_SIZE = 5
MIN_SIZE = 0

class Board {
    @size = 36 # I think size means number of points on the board
    @boardState = Array.new(6){Array.new(6)}


    def __init__() {

    #Init the boardState
    for i in @boardState
        for j in @boardState[i]

            #Init black pieces in cells on the top two rows
            if i == 0 OR i == 1 
                piece = Piece.new(:black)
                @boardState[i][j] = Cell.new(i, j, piece)

            #Init white pieces in cells on the bottom two rows
            elsif i == 4 OR i == 5
                piece = Piece.new(:white)
                @boardState[i][j] = Cell.new(i, j, piece)
            
            #Init empty cells in the middle rows
            else
                @boardState[i][j] = Cell.new(i, j, nil)
            
            # TO DO: NEEDS TO ESTABLISH THE LOOPS

    }

    # --------------------- PUBLIC METHODS ---------------------
    def validateWin() 
        blackExists = false
        whiteExists = false

        for i in @boardState:
            for j in @boardState[i]:
                if @boardState.contains?
                    if @boardState.contains?.getColour == :black
                        blackExists = true
                        if whiteExists
                            return false
                    elsif @boardState.contains?.getColour == :white
                        whiteExists = true
                        if blackExists
                            return false
        
        return true

    def move(current_cell, target_cell, colour)
        
        #Validating if positions exist on the board
        if current_cell.x? < MIN_SIZE or current_cell.x? > MAX_SIZE or current_cell.y? < MIN_SIZE OR current_cell.y? > MAX_SIZE
            return
        
        if target_cell.x? < MIN_SIZE or target_cell.x? > MAX_SIZE or target_cell.y? < MIN_SIZE OR target_cell.y? > MAX_SIZE
            return

        #Validate that current pos has a a piece and target does not
        if NOT current_cell.contains?
            return
        
        if target_cell.contains?
            return
        
        #Validating the positions are within one of each other, if so, make the move
        x_diff = current_cell.contains?.x? - target_cell.contains?.x? 
        y_diff = current_cell.contains?.y? - target_cell.contains?.y? 


        if (x_diff).abs == 1 AND (y_diff).abs == 1
            target_cell.replacePiece(current_cell.contains?)
            current_cell.replacePiece(nil)




    # --------------------- PRIVATE METHODS ---------------------
    private

    #Not sure how to implement this since there's no arguments
    def validateMove

    #Not sure how to implement this since there's no arguments
    def validateCapture


