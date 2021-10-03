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

# This cactches the empty names input
class NoName < StandardError
  def message
    'No Name Entered! '.bold.colorize(:red)
  end
end

# This cathces the empty game name input
class NoGame < StandardError
  def message
    'No Game Name Entered! '.bold.colorize(:red)
  end
end

# This works with the name_reciver() to prompt for the users name
def get_name
  puts 'To find the games instructions at any point in the game enter: "help"'.bold.colorize(:green)
  puts 'To exit the game at any time enter: "exit"'.bold.colorize(:green)
  puts 'Press "enter" to continue to the game!'.bold.colorize(:red)
  gets
  system 'clear'
  puts 'Please enter player name!' .bold.colorize(:green)
  player = gets.strip.upcase
  system 'clear'
  help(player)
  if player.downcase == 'exit'
    puts 'Good Bye'.bold.colorize(:blue)
    exit
  end
  raise NoName if player.empty?
  puts "Welcome #{player}".bold.colorize(:blue)
  player
end

# This works with get_name() to prompt for the users name
def name_receiver
  player = get_name
rescue NoName => e
  puts e.message
  retry
end

# This works with game_reciver() to prompt for the game the user wants to play
def get_game
  puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
  puts 'Enter the game name to play!'.bold.colorize(:green)
  input = gets.strip.downcase
  system 'clear'
  help(input)
  raise NoGame if input.empty?
  until (input == 'bt') || (input == 'free') || (input == 'speed')
    puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
    puts 'Enter the game name to play!'.bold.colorize(:red)
    puts "Incorrect input please enter 'free' or 'speed' or 'bt'".bold.colorize(:red)
    input = gets.chomp
    system 'clear'
  end
  puts "Game #{input}".bold.colorize(:blue)
  input
end

# This works with get_game() to prompt for the game the user wants to play
def game_receiver
  input = get_game
rescue NoGame => e
  puts e.message
  retry
end