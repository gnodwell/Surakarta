require_relative 'board'
require_relative 'session host'

class Player
    @name = ""
    @numPieces = nil
    @turn = nil
    @boardState = nil
    @host = nil

    #@restart --> Assuming this is another instance variable that needs to be created

    def initialize() 
       #Assuming name is passed in the initialization
       #@name = name
    end

    # --------------------- PUBLIC METHODS ---------------------

    def checkRestart()
        #is there a restart var that is to be checked? If so it can implemented as such:
        #return @restart 
    end

    def setRestart()
        #Assuming a restartValue is passed as an argument (e.g. setRestart(restartValue))
        #Is there a restart var that is to be checked? If so it can implemented as such:
        #@restart = restartValue
    end
    
    # --------------------- PRIVATE METHODS ---------------------
    private
end
