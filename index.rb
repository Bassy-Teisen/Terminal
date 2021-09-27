require 'colorize'

def check_answer?(right_answer, input)
    if right_answer == input
        puts "correct".cyan.bold
        return true
    else 
        puts "wrong".red.bold 
        return false
    end
end

def game_calcultation 

    
end




count = 0        
right_ans = 0
wrong_ans = 0
array = [1,2,3]
exit_app = false
while exit_app == false do 
    system "clear"
    puts "Type game type to play"
    puts "options: speed, free" 
    input = gets.chomp
    if input == "speed"
        puts "Please enter player name"
        player = gets.chomp.upcase
        
 
        array.each do |num|
            ans_sample = array.sample 
            puts "#{num} + #{ans_sample} = "
            random_number = num + ans_sample
            user_input = gets.chomp.to_i
            count += 1

            if user_input == "exit"
                break
            end
            
            variable = check_answer?(random_number, user_input)
            if variable == true
                right_ans += 1
            else
                wrong_ans += 1
            end
            
        # end  
            unless array.length > count
        # def game_output        
                if right_ans > 0 
                puts "#{player}'s score: #{right_ans} correct #{wrong_ans} wrong".cyan.bold
                elsif wrong_ans >= 0
                    puts "#{player}'s score: #{right_ans} correct #{wrong_ans} wrong".red.bold
                else 
                puts "no answers".red.bold
                end                 
            end

        
    end
    puts "Do you want to play again?"
    play_again = gets.chomp
    if play_again == "yes"
        next
    elsif play_again == "no"

    else
        break
    end    

    puts "not this"
        gets.chomp
    elsif input == "free"
        puts "freeplay chosen"
    elsif input == "exit"
        exit_app = true
    else
        system "clear"
        puts "Incorrect input please type either speed or free or exit"
        puts "press enter to continue..."
        gets.chomp
    end
end




# require 'csv'
# CSV.open('answers.csv', 'a', :headers => true ) do |csv|
#     csv << [free_player, math1.r]
# end  
