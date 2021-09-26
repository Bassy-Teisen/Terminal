class Game

    attr_reader :player, :r
    def initialize(name)
    @player = name
    @r = 0
    end    
def speed_maths
    
    num_seconds = 30
    num_stabs = 0
    start_time = Time.now.to_i
    current_time = Time.now.to_i
        while current_time < start_time + num_seconds
            # p "Speed Maths 30 seconds"
            # input = gets.chomp
            a = [1,2,3,4,5,6,7,8]
            
            w = 0
            a.each do |num|
                x = a.sample 
                
                if @r < 5
                printf "#{num} + #{x} = "
                num = num + x
                ans = gets.chomp.to_i
                else 
                    printf "#{num} - #{x} = "
                    num = num - x
                    ans = gets.chomp.to_i
                end
                if num == ans
                p "correct"
                @r += 1 
                
                else
                p "wrong" 
                w += 1
                end
                # if Time.now.to_i == start_time + num_seconds 
                #     c = 5
                #     while c > -1 do printf "blah: #{c}\r"   
                #     c = c-1
                #     sleep 1
                #     end
                # end
                if Time.now.to_i < start_time + num_seconds
                    
                    
                    num_stabs +=1
                else 
                    puts "Time's up"
                break
                end
                
            end 
              current_time = Time.now.to_i
            end

            puts "Total score #{num_stabs}"
   
            
            if @r > 0 
                "#{player}'s score: #{@r} correct and #{w} wrong"
            elsif w > 0
                "#{player}'s score: #{@r} correct and #{w} wrong"
            else 
                "no answers"
             
        end

    end
end 
speed_maths = Game.new("Bassy")
p speed_maths.speed_maths
# p speed_maths.r 
# p speed_maths.player