class BoardController < ApplicationController
  helper_method :move
  def index
    # helpers.move(current_cell, target_cell, colour)
  end

  def new
    board = Board_class.new
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

end