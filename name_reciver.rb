require_relative 'leader_board.rb'
require_relative 'name_reciver.rb'
require_relative 'help.rb'
require_relative 'game_input.rb'

class NoName < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 

class NoGame < StandardError
    def message
        "No Game Name Entered! ".bold.colorize(:red)
    end 
end 



def get_name
    puts 'To find the games instructions at any point in the game enter: "help"'.bold.colorize(:green)
    puts "Press any key to continue to the game!".bold.colorize(:red)
    gets
    system 'clear'
    puts 'Please enter player name!' .bold.colorize(:green)
    player = gets.strip.upcase
    system 'clear'
    help(player)
    if player.downcase == "exit"
        puts "Good Bye".bold.colorize(:blue)
        exit
    end
    raise NoName if player.empty?
    puts "Welcome #{player}".bold.colorize(:blue)
    player
end 


def name_receiver()
    begin
        player = get_name()
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
    raise NoGame if input.empty?
    until input == "bt" or input == "free" or input == "speed"
        puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
        puts 'Enter the game name to play!'.bold.colorize(:red)
        puts "Incorrect input please enter 'free' or 'speed' or 'bt'".bold.colorize(:red)
        
        input = gets.chomp
        system 'clear'
    end
    # raise NoGame if input.exclude?("free", "bt", "speed")
    puts "Game #{input}".bold.colorize(:blue)
    input
end

def game_receiver()
    begin
        input = get_game()
    rescue NoGame => e
        puts e.message
        retry  
        end     
end 