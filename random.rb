
class Tally
  attr_reader :hash
  attr_accessor :container, :b
  def initialize
    @b = []   
    @file = File.open('leaderlist.txt', 'r')
    @container = @file.read    
    @hash 
  end
  def check(hash)
    @hash = hash
    p @container
    # this extracts the hash value
    hash.each do |_key, value|
      hs = value
      # this extracts container value
      @container.each do |cvalue|
        p cvalue
        cvalue.each do |_key, value|
          # Checks if new value is greater than container value
          next unless hs.to_i > value
          @container = @container[0].merge(hash)
          @container = @container.sort_by { |_key, value| value }.to_h
          @container = @container.to_a.reverse.to_h
          @b = @container
          p @b
          break
        end
      end
    end
  end
end

class GameTally < Tally
  attr_reader :score3
  @@score3 = []
  def reciever
    @@score3 << @b
    x = 0
    sc = []
    @@score3.each do |num|
      num.each do |_key, value|
        next unless value > x
        x = value
        sc = num
      end
    end
    p "Top score belongs to #{sc.keys[0]} the score is: #{sc.values[0]}"
  end
end

game1 = GameTally.new
game1.check(bassy: 77)


file = File.open('leaderlist.txt', 'w')
file.write(game1.b[0].to_h)
file.close

require 'csv'
CSV.open('people.csv', 'a') do |csv|
  csv << [game1.hash.keys[0], game1.hash.values[0]]
end 

