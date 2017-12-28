require 'rubygems'
require 'bundler/setup'
require './lib/connect4.rb'
include Connect4

game = Board.new

print "Player 1 name? \n"
playerOne= gets.to_s.chomp

print "Player 2 name? \n"
playerTwo= gets.to_s.chomp

xMove = "#{playerOne} is up. Enter column # for your X."
oMove = "#{playerTwo} is up. Enter column # for your O."
upPlayer= nil

while upPlayer==nil
    print "Who goes first? (1 for Player One or 2 for Player Two)\n"
    input=gets.to_i 
    if  input == 1
        upPlayer=playerOne
    elsif input == 2
        upPlayer=playerTwo
    end
    system "clear"
end

while game.full ==false && game.winner == false
    case
    when upPlayer==playerOne
        valid = false
        system "clear"
        puts game.printboard
        puts xMove
        until valid
            valid = game.move(gets.to_i, "X")
            print "Not a valid move. Try Again\n" if valid == false
        end
        upPlayer=playerTwo
    when upPlayer==playerTwo
        valid = false
        system "clear"
        puts game.printboard
        puts oMove
        until valid
            valid = game.move(gets.to_i, "O")
            print "Not a valid move. Try Again\n" if valid == false 
        end
        upPlayer=playerOne
    end
end

if game.full
    print "Game Over. Nobody wins!"
    exit
end
