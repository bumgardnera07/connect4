module Connect4
    class Board
        attr_reader :rows, :columns, :slots
        
        #Build a blank board. Standard Connect4 Board is 6 rows, 7 columns, including these as variables to allow for the code to extend to include other board set ups
        #set up the bottom row as the current playable cell in every column
        
        def initialize(rows=6, columns=7)
            @rows, @columns = rows, columns
            @slots = columns.times.map { [] } #2D array for storing which pieces get played in which column
        end
        
        def printboard
            board = "+#{'---+'*@columns}\n"
            board += "|#{@columns.times.map{|p|"#{(p+1).to_s.center(3)}|"}.join}\n"  #This is the row at the top that labels the columns
            board += "+#{'---+'*@columns}\n"
            @rows.times do |e| #make rows similar to the row above that contains pieces that are already played
                board += "|#{@columns.times.map{|column|"#{@slots[column][@rows-e-1].to_s.center(3)}|"}.join}\n" #adds a piece from the slots array if there is one
                board += "+#{'---+'*@columns}\n"
            end
            board
        end
        
        #define ways for the game to end 1:winner, 2: board is full
        
        def winner
            return false
        end
        
        def full
            fullColumns = @columns.times.map{|column| @slots[column].length == @rows} #make an array with columns that contain pieces for every row
            if  fullColumns.all?  #are all the columns full?
                return true
            else
                print fullColumns
                return false
            end
        end
        
        #users will choose a column to make a move
        #valid move returns true
        def move(column, type)
            if column <1 || column > @columns
                return false
            elsif @slots[column - 1].length >= @rows
                return false
            else 
                @slots[column-1].push type
                return true
            end
        end
        
    end
end