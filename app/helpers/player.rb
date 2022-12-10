require_relative 'board'
require_relative 'session host'

class Player
    @name = ""
    @numPieces = nil
    @turn = nil
    @boardState = nil
    @host = nil


    def initialize() 
       #im assuming name is passed in the initialization
       #@name = name
    end

    # --------------------- PUBLIC METHODS ---------------------

    def checkRestart()
        #is there a restart var that is to be checked?
        #return @restart 
    end

    def setRestart(restartValue)
        #@restart = restartValue
    end

    # --------------------- PRIVATE METHODS ---------------------
    private
end
