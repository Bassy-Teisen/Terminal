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

# This works with good_bye() to prompt the user if they wish to replay
def play_again(ques_ans)
  if ques_ans == 'y'
    true
  elsif ques_ans == 'n'
    false
  end
end

# This works with play_again() to prompt the user if they wish to replay
def good_bye
  input = nil
  puts 'Do you want to play again: y/n?'.bold.colorize(:green)
  input = gets.chomp
  system 'clear'
  help(input)
  until (input == 'y') || (input == 'n')
    puts "Incorrect input please enter 'y' or 'n'".bold.colorize(:green)
    input = gets.chomp
  end
  input != 'y'
end

# Puts out right or wrong message
def check_answer?(right_answer, input)
  if right_answer == input.to_i
    puts 'correct'.bold.colorize(:cyan)
    true
  else
    puts 'wrong'.bold.colorize(:red)
    false
  end
end

# Alters input from ARGV
def gets
  STDIN.gets
end

# This displays the score board at the end of every game
def total_score(play, right, wrong)
  system 'clear'
  puts "#{play}'s Total score: #{right} correct and #{wrong} wrong".bold.colorize(right.positive? ? :blue : :red)
end
