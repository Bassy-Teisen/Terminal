def math
  t = 1
  r = 0
  w = 0

  a = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  a.each do |num|
    x = a.sample
    t = a.sample + t
    num = num + x + t
    puts "plus #{num} plus #{x} plus #{t}"
    ans = gets.chomp.to_i

    if num == ans
      p 'correct'
      r += 1

    else
      p 'wrong'
      w += 1
    end
  end
  if r > 0
    p "#{r} correct #{w} wrong"
  elsif w > 0
    p "#{r} correct #{w} wrong"
  else
    p 'no answers'
  end
end

math 
