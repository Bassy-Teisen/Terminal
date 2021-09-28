require 'csv'
require 'smarter_csv'
require_relative 'index.rb'

def calculator(filename, new_game)
    data = SmarterCSV.process(filename)
    data.push(new_game)
    puts data
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

# #speed_round
# new_data = calculator("speedround.csv", {:name=>"glen", :score=>10, :game=>"game"})
# save_to_csv("speedround.csv", new_data)
# puts "would you like to view leaderboard?"
# input = gets.chomp


# #free play
new_data = calculator("freeplay.csv", {:name=>"Bassy", :score=>97, :game=>"game"})
save_to_csv("freeplay.csv", new_data)

# #brainteaser
# calculator("brainteaser.csv", {:name=>"adam", :score=>92, :game=>"game"})
