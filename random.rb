class Tally
  attr_reader
  attr_accessor :container
  def initialize
    @b = []
    @container = [score1: 4, score2: 1, score3: 1, score4: 4, score5: 1]
  end
  def check(hash)
    # this extracts the hash value
    hash.each do |_key, value|
      hs = value
      # this extracts container value
      @container.each do |cvalue|
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
game1.reciever
