module Connect4
    class Board
        attr_reader :rows, :columns, :playablecell
        
        #Build a blank board. Standard Connect4 Board is 6 rows, 7 columns, including these as variables to allow for the code to extend to include other board set ups
        #set up the bottom row as the current playable cell in every column
        
        def initialize(rows=6, columns=7)
            @rows, @columns = rows, columns
            @playablecell = columns.times.map { [] }
        end
        
        def printboard
            board = "+#{'---+'*@columns}\n"
            board += "|#{@columns.times.map{|p|"#{(p+1).to_s.center(3)}|"}.join}\n"
            board += "+#{'---+'*@columns}\n"
            return board
        end
        
        #users will choose a column to make a move
        #valid move returns true
        def move(column, type)
            if column <1 || column > @columns
                return false
            elsif @playablecell[column - 1].length >= @rows
                return false
            else 
                @playablecell[col-1].push type
                return true
            end
        end
        
    end
end