require 'colorize'
require 'ordinal'
class NoName < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 
class NoGame < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 

def gets
    return STDIN.gets
end

def get_name
    puts 'Please enter player name! or "help" to find game instructions!'.bold.colorize(:green)
    player = gets.strip.upcase
    system 'clear'
    help(player)
    if player.downcase == "exit"
        puts "Good bye".bold.colorize(:blue)
        exit
    end
    raise NoName if player.empty?
    puts "Welcome #{player}".bold.colorize(:blue)
    player
end 


def name_receiver(name)
    begin
        return name
    rescue NoName => e
        puts e.message
        retry
    end 
end 
# not working when random game name entered
def get_game
    puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
    puts 'Enter the game name to play!'.bold.colorize(:green)
    input = gets.strip.downcase
    system 'clear'
    help(input)

    help_output(input) if input == "help"
    raise NoName if input.empty?
    # raise NoGame if input.exclude?("free", "bt", "speed")
    puts "Game #{input}".bold.colorize(:blue)
    input
end 
def help(input)
    if input.downcase == "help"
        help_output()
    end
end

def help_output
    puts "To continue press enter to continue"
    puts 'To view insrtuctions --help'
    puts 'To view score enter "score"'
    puts 'If you wish to exit type: "exit"'
    reply = gets.chomp
    exit if reply == "exit"
    file = File.foreach("help.txt") { |line| puts line } if reply == "--help"
    p score_bt = SmarterCSV.process('freeplay.csv')  if reply == "score"
    p score_bt = SmarterCSV.process('speed.csv')  if reply == "score"
    p score_bt = SmarterCSV.process('brain_teaser.csv')  if reply == "score"

end

def play_again(ques_ans)
    if ques_ans == 'y'
      true 
    elsif ques_ans == 'n'
      false
    end
end

def total_score(play, right, wrong)
    system 'clear'
    puts "#{play}'s Total score: #{right} correct and #{wrong} wrong".bold.colorize(right.positive? ? :blue : :red)

end

def good_bye()
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
# Use gem ordinal
def leader_board(new_data)
    print_place(1.to_ordinal, new_data[0][:name], new_data[0][:score])
    print_place(2.to_ordinal, new_data[1][:name], new_data[1][:score])
    print_place(3.to_ordinal, new_data[2][:name], new_data[2][:score])
    print_place(4.to_ordinal, new_data[3][:name], new_data[3][:score])
    print_place(5.to_ordinal, new_data[4][:name], new_data[4][:score])
end
def print_place(place, player_name, score)
    puts "#{place} Place goes to: #{player_name}! with a score of: #{score}".bold.colorize(:blue)
end





if ARGV.include?("--help")
    p file = File.read('help.txt')
    help_output()
      if ARGV.include?("--bt")
        puts 'Brain Teaser'.bold.colorize(:blue)
        p SmarterCSV.process('brain_teaser.csv')
        exit
      elsif ARGV.include?("--speed")
        puts 'Speed'.bold.colorize(:blue)
        p SmarterCSV.process('speed.csv')
        exit 
      elsif ARGV.include?("--free")
        puts 'Free'.bold.colorize(:blue)
        p SmarterCSV.process('freeplay.csv')
        exit  
      end
       
end