require 'colorize'

class NoName < StandardError
    def message
        "Name it right "
    end 
end 




def check
    def get_name
        system 'clear'
        puts 'Please enter player name'.bold.colorize(:green)
        player = gets.strip.upcase
        raise NoName if player.empty?
        player
    end 
    begin 
        player = get_name
        puts "the name is #{player}"
        player
    rescue NoName => err
        puts err.message
        retry
    end 
end 

