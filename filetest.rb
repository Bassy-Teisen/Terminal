
def print_list
    index = 1
    File.foreach('leaderlist.txt') do |item|
        puts "#{index}.#{item.chomp(',').capitalize}"
        index += 1
    end
end

# file = File.open('leaderlist.txt', 'a')
# file.write("orange juice\n")
# file.write("pineapple juice\n")
# file.close
print_list