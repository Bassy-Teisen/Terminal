

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
    puts score_free = SmarterCSV.process('freeplay.csv')  if reply == "score"
    puts score_speed = SmarterCSV.process('speed.csv')  if reply == "score"
    puts score_bt = SmarterCSV.process('brain_teaser.csv')  if reply == "score"

end