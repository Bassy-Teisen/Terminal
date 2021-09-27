require 'colorize'
exit_app = false
while exit_app == false do 
    system "clear"
    puts "Type game type to play"
    puts "options: speed, free" 
    input = gets.chomp
    if input == "speed"
        player = name.upcase
        count = 0
        array = [1,2,3]
        right_ans = 0
        wrong_ans = 0
        array.each do |num|
            ans_sample = array.sample 
            puts "#{num} + #{ans_sample} = "
            num = num + ans_sample
            answer = gets.chomp
            ans_int = answer.to_i
            count += 1
            
        # def answer_output
            unless answer == "exit"
                if num == ans_int
                puts "correct".cyan.bold
                right_ans += 1 
                elsif
                puts "wrong".red.bold 
                wrong_ans += 1
                else answer == "exit"   
                end
            else
                puts "You stay classy San Diego!".cyan.bold
                break
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
        # end    
            end
        end
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
