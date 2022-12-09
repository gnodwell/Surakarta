class Coin
    @face

    def __init__(face)
        @face = face
    end

    def get_face()
        return @face
    end

    def flip()
        side = rand(1..2)

        if side == 1
            @face = :H
        else
            @face = :T
        end

        return self
    end
end