require_relative 'path_map'
require_relative 'coin'
require_relative 'game_session'

class Session_host
    @hostCoin = nil
    @starting = nil
    @reset = nil
    @players = []
    @currentSession = nil

    def initialize()
        
        @currentSession = Game_Session.new
        @hostCoin = Coin.new
        ans = @hostCoin.flip()
        creatPathMapEntries()

        if ans == :H
            @starting = @players[0]
        else 
            @starting = @players[1]
        end

    end

    def create()


    end

    def joinSession(player)
        @players.push(player)

        if @players.length() == 2
            ans = @hostCoin.flip()

            if ans == :H
                @starting = @players[0]
            else 
                @starting = @players[1]
            end
            return true
        else
            createGameSession()
        end

        return false
    end

    private
    def creatPathMapEntries(board_id)
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
                    #pathMap.instance_variable_get(:@startCellId) = startCell
                    pathMap.startCellId = startCell
                    pathMap.endCellId = endCell
                    
                    #pathMap.instance_variable_get(:@endCellId) = endCell
                    pathMap.save
                end
            end
        end
    end
end

