class Tally
    attr_reader :score
    attr_accessor :container

    

    def initialize(persons_score)
        @score = persons_score
        @container = [3,1,1,4,1]
        
    end 
    def to_i
        @container << @score
    end 
    def check(ps)
        p ps
        p @container
        if  ps.to_i > @container[0][0]
            @container << ps    
        end
        @container = @container.sort
        p @container.length 
        if @container.length > 5
            @container.delete_at(0)
        end
        

    
    end
    # def organizse
    #     container.each do |num|

    # end
    
end 

game1 =Tally.new(1)
game1.check(2)
p game1.container
