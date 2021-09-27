# frozen_string_literal: true

require 'colorize'

def check_answer?(right_answer, input)
  if right_answer == input
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
array = [1, 2, 3]
exit_app = false
while exit_app == false
  system 'clear'
  puts 'Type game type to play'
  puts 'options: speed, free'
  input = gets.chomp

  # start of Speed
  if input == 'free'
    puts 'Please enter player name'
    player = gets.chomp.upcase

    array.each do |num|
      ans_sample = array.sample
      puts "#{num} + #{ans_sample} = "
      random_number = num + ans_sample
      user_input = gets.chomp.to_i
      count += 1

      break if user_input == 'exit'

      variable = check_answer?(random_number, user_input)
      if variable == true
        right_ans += 1
      else
        wrong_ans += 1
      end

      unless array.length > count

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
        return
      else
        puts "Incorrect input please enter 'yes' or 'no'"
        play_again = gets.chomp
      end
    end
  elsif input == 'speed'
    puts 'Please enter player name'
    player = gets.chomp.upcase
    right_answers = 0
    num_seconds = 3
    start_time = Time.now.to_i
    current_time = Time.now.to_i
    while current_time < start_time + num_seconds
      # p "Speed Maths 30 seconds"
      # input = gets.chomp
      numbers = [1, 2, 3, 4, 5, 6, 7, 8]

      wrong_ans = 0
      numbers.each do |num|
        num_sample = numbers.sample
        if count < 6 || count > 10
          printf "#{num} + #{num_sample} = "
          num += num_sample
        else
          printf "#{num} - #{num_sample} = "
          num -= num_sample
        end

        # getting answer
        answer = gets.chomp
        ans = answer.to_i

        # break if too slow
        if Time.now.to_i > start_time + num_seconds
          puts "Time's up".red.bold
          gets.chomp
          break
        end

        # exit if user quits
        if answer == 'exit'
          puts 'You stay classy San Diego!'.cyan.bold
          break

        elsif num == ans
          puts 'correct'.cyan.bold
          right_answers += 1

        else
          puts 'wrong'.red.bold
          wrong_ans += 1

        end

      end
      current_time = Time.now.to_i
    end

    puts "Total score #{right_answers}".blue.bold

    
    # if right_answers.positive?
    #   color = :blue
    # else
    #   color = :red
    # end

    # color =  right_answers.positive? ? :blue : :red
    # puts "#{player}'s score: #{right_answers} correct and #{wrong_ans} wrong".colorize(color)

    puts "#{player}'s score: #{right_answers} correct and #{wrong_ans} wrong".colorize(right_answers.positive? ? :blue : :red)
    puts 'press enter to continue'
    gets.chomp
  end
end