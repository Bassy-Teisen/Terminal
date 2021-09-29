require 'colorize'

class NoName < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 

def get_name
    puts 'Please enter player name!'.bold.colorize(:green)
    player = gets.strip.upcase
    system 'clear'
    puts "Welcome #{player}".bold.colorize(:blue)
    raise NoName if player.empty?
    player
end 


def check
    begin
        player = get_name
        player
    rescue NoName => err
        puts err.message
        retry
    end 
end 

