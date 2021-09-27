# frozen_string_literal: true

require 'colorize'

def check_answer?(right_answer, input)
  if right_answer == input.to_i
    puts 'correct'.cyan.bold
    true
  else
    puts 'wrong'.red.bold
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
  puts 'options: speed, free'
  input = gets.chomp
  system 'clear'
  # start of Speed
  if input == 'free'
    puts 'Please enter player name'
    player = gets.chomp.upcase

    numbers.each do |num|
      num_sample = numbers.sample
      puts "#{num} + #{num_sample} = "
      correct_answer = num + num_sample
      user_input = gets.chomp
      count += 1

      break if user_input == 'exit'

      variable = check_answer?(correct_answer, user_input)
      if variable == true
        right_ans += 1
      else
        wrong_ans += 1
      end

      unless numbers.length > count

        if right_ans > 0
          puts "#{player}'s score: #{right_ans} correct #{wrong_ans} wrong".cyan.bold
        elsif wrong_ans >= 0
          puts "#{player}'s score: #{right_ans} correct #{wrong_ans} wrong".red.bold
        else
          puts 'no answers'.red.bold
        end
      end
    end

    unless exit_app == true
      puts 'Do you want to play again?'
      play_again = gets.chomp
      count = 0
      if play_again == 'yes'
        next
      elsif play_again == 'no'
        exit_app = true
        break
      else
        puts "Incorrect input please enter 'yes' or 'no'"
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

        
        
        variable = check_answer?(correct_answer, user_input)
        if variable == true
          right_ans += 1
        else
          wrong_ans += 1
        end

        # break if too slow
        if Time.now.to_i > start_time + num_seconds
          system 'clear'
          puts "Time's up".red.bold
          puts "#{player}'s Total score: #{right_ans} correct and #{wrong_ans} wrong".bold.colorize(right_ans.positive? ? :blue : :red)
          gets.chomp
          break
        end
      end
      current_time = Time.now.to_i
    end

    
    puts "#{player}'s score: #{right_ans} correct and #{wrong_ans} wrong".bold.colorize(right_ans.positive? ? :blue : :red)
    puts 'press enter to continue'
    gets.chomp
  end
end