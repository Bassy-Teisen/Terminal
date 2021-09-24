class Tally
  attr_reader 
  attr_accessor :container

  def initialize
    
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

          break
        end
      end
    end
  end
end

class GameTally < Tally
    attr_reader :score1, :score2

    @@score3 = []

    
    def reciever(name1, name2)

        
        @@score3 << name1
        @@score3 << name2
        p @@score3
        x = 0
        sc = []
        @@score3.each do |num|
            num.each do |key, value|
            if value > x
                x = value
                sc = num
                
            end   
            end
            
        end
        p "Top score belongs to #{sc.keys[0]} their score is: #{sc.values[0]}"
        p x
    end 
    
end

game1 = GameTally.new
game1.check(bassy: 2)
p game1
# game2 = Tally.new
# game2.check(:bassy => 3)
# p game2



game1.reciever({:bassy => 29}, {:bassy2 => 38})
