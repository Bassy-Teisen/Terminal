


def interval(seconds)
    
    yield
    sleep seconds 
    
end
    interval(7) do           
end

c = 5
while c > -1 do printf "blah: #{c}\r"
    c = c-1
    sleep 1
end
printf " "*20 + "\r "

