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



font = TTY::Font.new(:doom)
system 'clear'
puts font.write("100mm Harry", letter_spacing: 1).colorize(:cyan)


exit_app = false
player = name_receiver()
player_scores = {}

input = game_receiver()

while exit_app == false
  count = 0
  right_ans = 0
  wrong_ans = 0
  numbers = [1, 2, 3, 4, 5]
  # Prompt the player for game
  
  return if input == 'exit'

  # Start of free
  if input == 'free'
    numbers.each do |num|
      num = num * 100
      num_sample = numbers.sample * 100
      print "#{num} + #{num_sample} = "
      correct_answer = num + num_sample
      user_input = gets.chomp
      system 'clear'
      count += 1
      break if user_input == 'exit'

      # Answer checker
      answer = check_answer?(correct_answer, user_input)
      if answer == true
        right_ans += 1
      else
        wrong_ans += 1
      end
      unless numbers.length > count
        total_score(player, right_ans, wrong_ans)
        count = 0
      end
    end

    begin
      if right_ans > player_scores[:free][:scores]
        player_scores[:free] = { name: player, score: right_ans, game: "free" }
      end
    rescue
      player_scores[:free] = { name: player, score: right_ans, game: "free" }
    end

    exit_app = good_bye()

  elsif input == 'speed'
    count = 0
    num_seconds = 3
    start_time = Time.now.to_i
    current_time = Time.now.to_i
    while current_time < start_time + num_seconds

      numbers.each do |num|
        num_sample = numbers.sample * 100
        if count < 6 || count > 10
          print "#{num} + #{num_sample} = "
          correct_answer = num + num_sample
        else
          print "#{num} - #{num_sample} = "
          correct_answer = num - num_sample
        end
        count += 1
        # getting answer
        user_input = gets.chomp
        system 'clear'

        # exit if user quits
        break if user_input == 'exit'

        # Answer checker
        answer = check_answer?(correct_answer, user_input)
        if answer == true
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
        player_scores[:speed] = { name: player, score: right_ans, game: "speed" }
      end
      current_time = Time.now.to_i
    end

    exit_app = good_bye()
  end

  next unless input == 'bt'

    temp_con = []
  numbers.each do |num|
    num = num * 100
    temp_con << numbers.sample + numbers.sample * 100
    var_number = 0
    temp_con.each do |num_temp|
      var_number += num_temp
    end
    num_sample = numbers.sample
    print "#{num} + #{num_sample} x #{var_number} = "
    num = num + num_sample * var_number
    answer = gets.chomp
    ans_int = answer.to_i
    # count += 1

    if answer == 'exit'
      puts "#{player}'s Reached level: #{right_ans}".bold.colorize(right_ans.positive? ? :blue : :red)
      puts 'You stay classy San Diego!'.bold.colorize(:cyan)
      break
    elsif num == ans_int
      puts 'correct'.bold.colorize(:cyan)
      right_ans += 1
    else
      puts 'wrong'.bold.colorize(:red)
      puts "#{player}'s Reached level: #{right_ans}".bold.colorize(right_ans.positive? ? :blue : :red)
      temp_con << 0
  # player = player_name
      player_scores[:bt] = { name: player, score: right_ans, game: 'Brain_Teaser' }
      break
    end
    player_scores[:bt] = { name: player, score: right_ans, game: 'Brain_Teaser' }
  end
  exit_app = good_bye()

end

def calculator(filename, new_game)
  data = SmarterCSV.process(filename)
  data.push(new_game)
  data = data.sort_by { |hash| hash[:score] }.reverse
  data.pop until data.length < 6
  data
end

def save_to_csv(filename, data)
  CSV.open(filename, 'w') do |csv|
    csv << %w[name score game]
    data.each do |thing|
      csv << [thing[:name], thing[:score], thing[:game]]
    end
  end
end
# p player_scores[:bt]

if player_scores[:bt]
  new_data = calculator('brain_teaser.csv', player_scores[:bt])
  save_to_csv('brain_teaser.csv', new_data)
  system 'clear'
  puts 'Brain Teaser'.bold.colorize(:blue)
  leader_board(new_data)
end
if player_scores[:free]
  new_data = calculator('freeplay.csv', player_scores[:free])
  save_to_csv('freeplay.csv', new_data)
  system 'clear'
  puts 'Free'.bold.colorize(:blue)
  leader_board(new_data)
end

if player_scores[:speed]
     new_data = calculator('speed.csv', player_scores[:speed])
     save_to_csv('speed.csv', new_data)
     system 'clear'
     puts 'Speed'.bold.colorize(:blue)
     leader_board(new_data,)
end
