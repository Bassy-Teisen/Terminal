
class Score
    
    
    attr_accessor :score

    def initialize(score)
        @score = score 
     p @score   
    end
    
end 


# g = Score.new(:bassy => 77)

# p g.score
# p g1





class Tally < Score
    
  attr_reader 
  attr_accessor :container

  def initialize(score)
     super(score)
    @container = [score1: 4, score2: 1, score3: 1, score4: 4, score5: 1]
    @new = []
    
  end
  
  def check
    
    # this extracts the hash value
    @score[0].each do |value|
      hs = value[0]
      p @score.class
      p value.to_h
      p hs
      # this extracts container value
      hs.each do |cvalue|
        cvalue.each do |_key, value|    
            # Checks if new value is greater than container value
          next unless hs.to_i > value
          @container = @container[0].merge(@score)
          @container = @container.sort_by { |_key, value| value }.to_h
          @container = @container.to_a.reverse.to_h
          @new << @container
          p @new
          break
        end
      end
    end
    
  end
end




class GameTally < Tally
    

    def initialize(score)
        super(score)
        
        super(@container)
    end
    
    def reciever
        
        
        # p @con
        # @score3 << @score#This could be altered to take in a whole scoreboard or just recieve top valey or scoreboard
        
        x = 0
        sc = []
        @score.each do |num|
            num.each do |key, value|
            if value > x
                x = value
                sc = num
              p x 
              
            end   
            end
            
        end
        p "Top score belongs to #{sc.keys[0]} their score is: #{sc.values[0]}"
        p x
    end 
    
end

game1 = GameTally.new(:bassy => 77)
game2 = GameTally.new(:bassy2 => 88)
# p game1
# game2 = Tally.new

# p game2


# p game1.check
# game1.reciever({:bassy => 29}, {:bassy2 => 38})
p game2.check
p game1
p game1.reciever
