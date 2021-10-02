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


class NoFile < StandardError
  def message
    "Sonthing is wrong with uplaoding the leaderboard file"
  end
end 

def name_receiver()

  begin

      player = get_name()
  rescue NoName => e
      puts e.message
      retry  
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
      puts "Press anykey to continue".bold.colorize(:green)
      gets
end