module Connect4
    class Board
        attr_reader :rows, :columns, :cells
        
        #Build a blank board. Standard Connect4 Board is 6 rows, 7 columns
        
        def initialize(rows=6, columns=7)
            @rows, @columns = rows, columns
            @cells = columns.times.map { [] }
        end
        
        def print_board
            board = "+#{'---+'*@columns}\n"
            board << "|#{@columns.times.map{|p|"{#(p+1).to_s.center(3)}|"}.join}\n"
            board << "+#{'---+'*@columns}\n"
            board
        end
        