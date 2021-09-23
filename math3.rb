
def math
    
    
    t = []
    a = [1,2,3,4]
    r = 0
    w = 0
    a.each do |num|
        t << a.sample + a.sample
        v = 0
        t.each do |n|
            v = v + n
        end
        x = a.sample 
        puts "plus #{num} plus #{x} plus#{v}"
        num = num + x + v
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

