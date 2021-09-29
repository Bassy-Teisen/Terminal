require 'colorize'

class NoName < StandardError
    def message
        "No Name Entered! ".bold.colorize(:red)
    end 
end 

def gets
    return STDIN.gets
end

def get_name
    puts 'Please enter player name!'.bold.colorize(:green)
    player = gets.strip.upcase
    system 'clear'
    help(player)
    if player.downcase == "exit"
        puts "Good bye"
        exit
    end
    raise NoName if player.empty?
    puts "Welcome #{player}".bold.colorize(:blue)
    player
end 


def player_name
    begin
        return get_name
    rescue NoName => err
        puts err.message
        retry
    end 
end 

def get_game
    system 'clear'
    puts 'Games: "speed" "free" "bt"'.bold.colorize(:blue)
    puts 'Enter the game name to play!'.bold.colorize(:green)
    input = gets.strip.downcase
    system 'clear'
    # help(input)
    help_output() if input == "help"
    raise NoName if input.empty?
    puts "Game #{input}".bold.colorize(:blue)
    input
end 

def player_game
    begin
        input = get_game
        input
        
    rescue NoName => err
        puts err.message
        retry
    end 
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

def leader_board(new_data)
    print_place("First", new_data[0][:name], new_data[0][:score])
    print_place("Second", new_data[1][:name], new_data[1][:score])
    print_place("Third", new_data[2][:name], new_data[2][:score])
    print_place("Fourth", new_data[3][:name], new_data[3][:score])
    print_place("Fifth", new_data[4][:name], new_data[4][:score])
end

def print_place(place, player_name, score)
    puts "#{place} Place goes to: #{player_name}! with a score of: #{score}".bold.colorize(:blue)
end

def help(input)
    if input.downcase == "help"
        help_output()
    end
end

def help_output
    puts 'If you wish to exit type: "exit"'
    # puts 'To view score end game'
    puts "press enter to continue"
    reply = gets.chomp
    exit if reply == "exit"
end