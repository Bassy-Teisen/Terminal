class NoName < StandardError
    def message
        "Name it right "
    end 
end 



def get_name
    print "enter name"
    name = gets.strip
    raise NoName if name.empty?
    name
end 

begin 
    name = get_name
    puts "the name is #{name}"
rescue NoName => err
    puts err.message
    retry
end 