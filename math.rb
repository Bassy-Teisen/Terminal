
def math
    
    
    a = [1,2,3]
    r = 0
    w = 0
    a.each do |num|
        x = a.sample 
        puts "plus #{num} plus #{x}"
        num = num + x
        ans = gets.chomp.to_i
        
        if num == ans
        p "correct"
        r += 1 
        
        else
        p "wrong" 
        w += 1
        end
        
        if r > 0 
            p "#{r} correct #{w} wrong"
        elsif w > 0
             p "#{r} correct #{w} wrong"
        else 
            p "no answers"
        end 
    
    end
end

math

