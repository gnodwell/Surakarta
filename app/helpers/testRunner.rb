require_relative 'cell'
require_relative 'piece'
require_relative 'board'


print ("Testing the cell\n")
print("Should return two successes\n")
piece1 = Piece.new(:white)
piece2 = Piece.new(:black)
cell1 = Cell.new(0, 0, piece1)

cell1.replacePiece(piece2)
if cell1.contains? == piece1
    print "Error: Cell contains piece1\n"
else 
    print "Success: Cell contains piece2\n"
end

if cell1.x? == 0 && cell1.y? == 0
    print "Success: Cell has correct coordinates\n"
else
    print "Error: Cell has incorrect coordinates\n"
end

print("Testing the board\n")
board = Board.new()

print("Getting the shape of the board after initialization\n")
(0..5).each do |y|
    (0..5).each do |x|
        if x == 0
            print("\n")
        end

        if board.getCell(x, y).contains? != nil
            print board.getCell(x, y).contains?.getColour, " (", x, ",", y,  ") | "

        else
            print board.getCell(x, y).class, "  (", x, ",", y, ") | "
        end
    end
end

print "\nSuccess!\n"
print("Checking if the board has a winner (Should be false)\n")
print board.validateWin, "\n"


print("Performing 5 valid moves (should return 5 trues in a row)\n")
print(board.move(board.getCell(0,1), board.getCell(0,2), :white), "\n")
print(board.move(board.getCell(1,1), board.getCell(2,2), :white), "\n")
print(board.move(board.getCell(4,4), board.getCell(4,3), :black), "\n")
print(board.move(board.getCell(4,3), board.getCell(4,4), :black), "\n")
print(board.move(board.getCell(5,4), board.getCell(5,3), :black), "\n")
(0..5).each do |y|
    (0..5).each do |x|
        if x == 0
            print("\n")
        end

        if board.getCell(x, y).contains? != nil
            print board.getCell(x, y).contains?.getColour, " (", x, ",", y,  ") | "

        else
            print board.getCell(x, y).class, "  (", x, ",", y, ") | "
        end
    end
end
print("\n")

print("Performing 3 invalid moves (should return 3 falses in a row)\n")
print(board.move(board.getCell(2,0), board.getCell(1,0), :black), "\n")
print(board.move(board.getCell(4,2), board.getCell(2,2), :black), "\n")
print(board.move(board.getCell(3,3), board.getCell(5,4), :black), "\n")

print("Checking if the board has a winner (Should be false)\n")
print board.validateWin, "\n"

print("Print the board")
(0..5).each do |y|
    (0..5).each do |x|
        if x == 0
            print("\n")
        end

        if board.getCell(x, y).contains? != nil
            print board.getCell(x, y).contains?.getColour, " (", x, ",", y,  ") | "

        else
            print board.getCell(x, y).class, "  (", x, ",", y, ") | "
        end
    end
end

print "\nPerforming a capture, should return two trues in a row\n"
print(board.move(board.getCell(5,3), board.getCell(5,2), :black), "\n")
print(board.capture(board.getCell(3,0), board.getCell(5,2)), "\n")

print "\nSuccess!\n"

print("Print the board")


(0..5).each do |y|
    (0..5).each do |x|
        if x == 0
            print("\n")
        end

        if board.getCell(x, y).contains? != nil
            print board.getCell(x, y).contains?.getColour, " (", x, ",", y,  ") | "

        else
            print board.getCell(x, y).class, "  (", x, ",", y, ") | "
        end
    end
end


print("\nPerform a few false captures (should return 3 falses in a row)\n")
print(board.capture(board.getCell(5,5), board.getCell(5,2)), "\n")
print(board.capture(board.getCell(4,4), board.getCell(4,4)), "\n")
print(board.capture(board.getCell(5,5), board.getCell(0,0)), "\n")
