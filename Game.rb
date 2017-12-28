require 'rubygems'
require 'bundler/setup'
require './lib/connect4.rb'
include Connect4

new_game = Board.new

print "Player 1 name?"
playerOne= gets.to_s

print "Player 2 name?"
playerTwo= gets.to_s

xMove = "#{playerOne} is up. Place your X"
oMove = "#{playerTwo} is up. Place your O"
firstPlayer= nil

while firstPlayer==nil
    print "Who goes first? (1 or 2)"
    if gets.to_i == 1
        firstPlayer=playerOne
    elsif gets.to_i == 2
        firstPlayer=playerTwo
    end
end

puts new_game.printboard


    
