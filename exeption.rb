def divide(num1, num2)
    if !num1.is_a?(Integer) || num2.is_a?(Integer)
        raise TypeError, "message goes here"
    end
    puts "#{num1} / #{num2} = #{num1 / num2}"
end


begin
    puts "numbers"
num1 = gets.chomp.to_i
num2 = gets.chomp.to_i
divide(num1, num2)
rescue ZeroDivisionError => err
    puts "cant't do that"
    p err.message
rescue TypeError => err
    puts "blah"
    p err.message
rescue 
    puts "anything"
end