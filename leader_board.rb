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

# This works with print_position() to displays the scores with a numbered position
def leader_board(new_data)
  print_position(1.to_ordinal, new_data[0][:name], new_data[0][:score])
  print_position(2.to_ordinal, new_data[1][:name], new_data[1][:score])
  print_position(3.to_ordinal, new_data[2][:name], new_data[2][:score])
  print_position(4.to_ordinal, new_data[3][:name], new_data[3][:score])
  print_position(5.to_ordinal, new_data[4][:name], new_data[4][:score])
end

# This works with leader_board() to displays the scores with a numbered position
def print_position(place, player_name, score)
  puts "#{place} Place goes to: #{player_name}! with a score of: #{score}".bold.colorize(:blue)
end

# This is how to access the help file and scores from outside the game
if ARGV.include?('--help')
  help_output
  if ARGV.include?('--bt')
    puts 'Brain Teaser'.bold.colorize(:blue)
    p SmarterCSV.process('brain_teaser.csv')
    exit
  elsif ARGV.include?('--speed')
    puts 'Speed'.bold.colorize(:blue)
    p SmarterCSV.process('speed.csv')
    exit
  elsif ARGV.include?('--free')
    puts 'Free'.bold.colorize(:blue)
    p SmarterCSV.process('freeplay.csv')
    exit
  end
  puts 'Press anykey to continue'.bold.colorize(:green)
  gets
end
