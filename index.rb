# frozen_string_literal: true

require 'colorize'

def total_score(player, right, wrong)
  system 'clear'
  puts "#{player}'s Total score: #{right} correct and #{wrong} wrong".bold.colorize(right.positive? ? :blue : :red)
  
end


def play_again(ques_ans)
  if ques_ans == 'y'
    true 
  elsif ques_ans == 'n'
    false
  end
end
# Creates good bye message
def good_bye()
  system 'clear'
  puts "Good bye!".bold.colorize(:blue)
end

# Asks do you want to play again
def do__play_again()
  puts 'Do you want to play again: y/n?'.bold.colorize(:green)
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

count = 0
right_ans = 0
wrong_ans = 0
numbers = [1, 2, 3]
exit_app = false
while exit_app == false
  system 'clear'
  puts 'Type game type to play'
  puts 'options: speed, free, bt'
  input = gets.chomp
  system 'clear'
  # start of free
  if input == 'free'
    puts 'Please enter player name'
    player = gets.chomp.upcase
    system 'clear'
    numbers.each do |num|
      num_sample = numbers.sample
      print "#{num} + #{num_sample} = "
      correct_answer = num + num_sample
      user_input = gets.chomp
      system 'clear'
      count += 1

      break if user_input == 'exit'

# Answer checker
      variable = check_answer?(correct_answer, user_input)
      if variable == true
        right_ans += 1
      else
        wrong_ans += 1
      end

      unless numbers.length > count
        total_score(player, right_ans, wrong_ans)
      end
    end

    unless exit_app == true
      do__play_again()
      play_again = gets.chomp
      count = 0
      vars = play_again(play_again)
      if vars == true
        next
      elsif vars == false
        exit_app = true
        good_bye()
      else
        puts "Incorrect input please enter 'y' or 'n'".bold.colorize(:green)
        play_again = gets.chomp
      end
    end
  
  
  elsif input == 'speed'
    puts 'Please enter player name'
    player = gets.chomp.upcase
    system 'clear'
    right_ans = 0
    num_seconds = 3
    start_time = Time.now.to_i
    current_time = Time.now.to_i
    wrong_ans = 0
    numbers = [1, 2, 3, 4, 5, 6, 7, 8]
    
    while current_time < start_time + num_seconds
      # p "Speed Maths 30 seconds"
      # input = gets.chomp

      numbers.each do |num|
        num_sample = numbers.sample
        
        if count < 6 || count > 10
          print "#{num} + #{num_sample} = "
          correct_answer = num + num_sample
        else
          print "#{num} - #{num_sample} = "
          correct_answer = num - num_sample
          
        end
        
        # getting answer
        user_input = gets.chomp
        system 'clear'

        # exit if user quits
        break if user_input == 'exit'

        
# Answer checker        
        variable = check_answer?(correct_answer, user_input)
        if variable == true
          right_ans += 1
        else
          wrong_ans += 1
        end

        # break if too slow
        if Time.now.to_i > start_time + num_seconds

          total_score(player, right_ans, wrong_ans)
          puts "Time's up".bold.colorize(:red)
          break
        end
      end
      current_time = Time.now.to_i
    end

    
    
 
    unless exit_app == true
      do__play_again()
      play_again = gets.chomp
      count = 0
      vars = play_again(play_again)
      if vars == true
        next
      elsif vars == false
        exit_app = true
        good_bye()
      else
        puts "Incorrect input please enter 'y' or 'n'".bold.colorize(:green)
        play_again = gets.chomp
      end
    end
  end
 
  if input == 'bt'
    
    numbers = [1,2,3,4]
    count = 0
    puts 'Please enter player name'.bold.colorize(:green)
    player = gets.chomp.upcase
    system 'clear'
    temp_con = []
    right_ans = 0
    wrong_ans = 0
    numbers.each do |num|
      temp_con << numbers.sample + numbers.sample
      var = 0
      temp_con.each do |num_temp|
      var = var + num_temp
      end
      num_sample = numbers.sample 
      print "#{num} + #{num_sample} + #{var} = "
      num = num + num_sample + var
      answer = gets.chomp
      ans_int = answer.to_i
      count += 1
     
     if answer == "exit"
      puts "#{player}'s Reached level: #{right_ans}".bold.colorize(right_ans.positive? ? :blue : :red)
     puts "You stay classy San Diego!".bold.colorize(:cyan)
     break

     elsif num == ans_int
     puts "correct".bold.colorize(:cyan)
     right_ans += 1 
     
     else
     puts 'wrong'.bold.colorize(:red)
     puts "#{player}'s Reached level: #{right_ans}".bold.colorize(right_ans.positive? ? :blue : :red)
     break
     end
    end 
  end
  
  unless exit_app == true
    do__play_again()
    play_again = gets.chomp
    count = 0
    vars = play_again(play_again)
    if vars == true
      next
    elsif vars == false
      exit_app = true
      good_bye()
    else
      puts "Incorrect input please enter 'y' or 'n'".bold.colorize(:green)
      play_again = gets.chomp
    end
  end
end
 