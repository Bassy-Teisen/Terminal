require 'colorize'
require 'csv'
require 'smarter_csv'
require_relative 'methods.rb'
require 'tty-font'
require 'ordinal'
# require 'rouge' # Need to check if i Actually need this
require 'test/unit'

class NoGame < StandardError
    def message
        "No Game Name Entered!".bold.colorize(:red)
    end 
end 


class NoName < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 



def get_name
    print "Enter your name: "
    name = gets.strip
    raise NoName if name.empty?
    name
end


begin
    name = get_name
    puts "balh #{name}"
rescue NoName => e 
    puts e.message
    retry
end


def get_game
    puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
    puts 'Enter the game name to play!'.bold.colorize(:green)
    input = gets.strip.downcase
    raise NoGame if input.empty?
    input
end

begin
    input = get_game
    puts "balh #{input}"
rescue NoGame => e 
    puts e.message
    retry
end
# player = name_receiver(get_name)
# input = name_receiver(get_game)


















# def get_name
#     puts 'Please enter player name! or "help" to find game instructions!'.bold.colorize(:green)
#     player = gets.strip.upcase
#     system 'clear'
#     raise StandardError, "blah" if player.empty?
#     puts "Welcome #{player}".bold.colorize(:blue)
    
#     player
# end 


# def name_receiver(name)
#     begin
#         return name
#     rescue StandardError => e
#         puts e.message
#         retry
#     rescue NoGame => e
#         puts e
#     end 
# end 

# player = name_receiver(get_name) 

# exit_app = false
# while exit_app == false



# end