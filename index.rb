# frozen_string_literal: true
# require_relative 'new_board.rb'
require 'colorize'
require 'csv'
require 'smarter_csv'
require_relative 'name.rb'

def good_bye_mthod()
  input = nil
  puts 'Do you want to play again: y/n?'.bold.colorize(:green)
  input = gets.chomp
  system 'clear'
  until input == "y" or input == "n"
    puts "Incorrect input please enter 'y' or 'n'".bold.colorize(:green)
    input = gets.chomp
  end
  return input == "y" ? false : true
end

def total_score(play, right, wrong)
  system 'clear'
  puts "#{play}'s Total score: #{right} correct and #{wrong} wrong".bold.colorize(right.positive? ? :blue : :red)
  
end

def play_again(ques_ans)
  if ques_ans == 'y'
    true 
  elsif ques_ans == 'n'
    false
  end
end



# Asks do you want to play again

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
x = {}
count = 0
right_ans = 0
wrong_ans = 0
numbers = [1, 2, 3]
exit_app = false
while exit_app == false
  system 'clear'
  puts 'Type game type to play'
  puts 'options: speed, free, bt'
  input = gets.strip
  system 'clear'
  # start of free
  if input == 'free'
    game = 'free'
    player = check
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
        count = 0
      end
      
      
    end
    x = {:name=>player, :score=>right_ans, :game=>game}
    exit_app = good_bye_mthod()

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
          x = {:name=>player, :score=>right_ans, :game=>game}
          break
        end
      end
      current_time = Time.now.to_i
    end
    exit_app = good_bye_mthod()
  end
 




  
  if input == 'bt'
    game = "Brain_teaser"
    numbers = [1,2,3,4]
    player = check
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
     x = {:name=>player, :score=>right_ans, :game=>game}
     break
     end
    end
    exit_app = good_bye_mthod() 
  end
  
end

system "clear"
puts "goodbye".bold.colorize(:blue)


def calculator(filename, new_game)
  data = SmarterCSV.process(filename)
  data.push(new_game)
  data = data.sort_by { |hash| hash[:score] }.reverse
  until data.length < 6
      data.pop
  end
  return data
end 

def save_to_csv(filename, data)
  CSV.open(filename, "w") do |csv|
      csv << ['name','score','game']
      data.each do |thing|
      csv << [thing[:name], thing[:score], thing[:game]]
      end
  end
  # save to csv
end

new_data = calculator("freeplay.csv", x)
save_to_csv("freeplay.csv", new_data)
puts "First Place goes to: #{new_data[0][:name]}! with a score of: #{new_data[0][:score]}".bold.colorize(:blue)
puts "Second Place goes to: #{new_data[1][:name]}! with a score of: #{new_data[1][:score]}".bold.colorize(:blue)
puts "Third Place goes to: #{new_data[2][:name]}! with a score of: #{new_data[2][:score]}".bold.colorize(:blue)
puts "Fourth Place goes to: #{new_data[3][:name]}! with a score of: #{new_data[3][:score]}".bold.colorize(:blue)
puts "Fith Place goes to: #{new_data[4][:name]}! with a score of: #{new_data[3][:score]}".bold.colorize(:blue)
