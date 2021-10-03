require_relative 'leader_board.rb'
require_relative 'name_reciver.rb'
require_relative 'help.rb'
require_relative 'game_input.rb'
require 'colorize'
require 'csv'
require 'smarter_csv'
require 'tty-font'
require 'ordinal'
require 'test/unit'

def help(input)
    if input.downcase == "help" 
        help_output()
    elsif input == 'exit'
        puts "Good Bye".bold.colorize(:blue)
        exit 
    end
end

def help_output
    puts "To continue press enter to continue"
    puts 'To view insrtuctions --help'
    puts 'To view score enter "score"'
    puts 'If you wish to exit type: "exit"'
    reply = gets.chomp
    
    until reply == "score" || reply == "--help" || reply == 'exit' || reply == 'resume'
        puts "Incorrect input please enter:".bold.colorize(:green)
        puts 'To view insrtuctions --help'
        puts 'To view score enter "score"'
        puts 'If you wish to exit type: "exit"'
        puts 'If you wish to back type: "resume"'
        reply = gets.chomp
    end
    exit if reply == "exit"
    file = File.foreach("help.txt") { |line| puts line } if reply == "--help"
    puts score_free = SmarterCSV.process('freeplay.csv')  if reply == "score"
    puts score_speed = SmarterCSV.process('speed.csv')  if reply == "score"
    puts score_bt = SmarterCSV.process('brain_teaser.csv')  if reply == "score"
    return if reply == "resume"
end