require_relative 'cell'
require_relative 'piece'
require_relative 'board'


print("Testing the board\n")
board = Board.new()

print("Getting the shape of the board after initialization\n")
(0..5).each do |i|
    (0..5).each do |j|
        if j == 0
            print("\n")
        end

        #print(board.getCell(i, j).contains?, "\n")
        if board.getCell(i, j).contains? != nil
            print board.getCell(i, j).contains?.getColour, " | "

        else
            print board.getCell(i, j).class, "  | "
        end
    end
end
print "\nSuccess!\n"
print("Checking if the board has a winner (Should be false)\n")
print board.validateWin, "\n"


print("Performing 5 valid moves (should return 4 trues in a row)\n")
print(board.move(board.getCell(1,0), board.getCell(2,0), :black), "\n")
print(board.move(board.getCell(1,2), board.getCell(2,3), :black), "\n")
print(board.move(board.getCell(4,4), board.getCell(3,4), :white), "\n")
print(board.move(board.getCell(3,4), board.getCell(4,4), :white), "\n")
print(board.move(board.getCell(4,5), board.getCell(3,5), :white), "\n")
(0..5).each do |i|
    (0..5).each do |j|
        if j == 0
            print("\n")
        end

        #print(board.getCell(i, j).contains?, "\n")
        if board.getCell(i, j).contains? != nil
            print board.getCell(i, j).contains?.getColour, " | "

        else
            print board.getCell(i, j).class, "  | "
        end
    end
end
print("\n")


print("Performing 3 invalid moves (should return 4 falses in a row)\n")
print(board.move(board.getCell(2,0), board.getCell(1,0), :white), "\n")
print(board.move(board.getCell(4,2), board.getCell(2,2), :white), "\n")
print(board.move(board.getCell(4,3), board.getCell(4,4), :white), "\n")
