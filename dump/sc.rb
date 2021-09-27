class Leaderboard 
    attr_accessor :highest_score, :score, :team, :count
    @@count = 0 # maybe use total leaderboard here as class vairable
    # maybe count.length > 5 remove last from array
    # maybe subclass the calculator for highest score
    # maybe third class to connect score and top score "30:00 mins inheritance video"
    def initialize(team)
    # Initialize is optional
        @team = team
        @highest_score = 0
        @score = []
        @@count += 1
        
    end
    def winner(score)
        @score << score
       
    end
    # maybe "def to_i" this will outo change to integer of to_str/to_s
    def clac
       @score[0].each do |key, value|
        value = value.to_i
        p value
        if value > @highest_score
        @highest_score = value
       
        end
    end
    def count
      @@count
    end
  end
end
blah = Leaderboard.new("bassy")

blah.winner({:bassy => 1 }) 
blah.winner({:bassy => 1 }) 
blah.winner({:bassy => 2 }) 
blah.highest_score = 5 #can add score
puts blah.clac
puts blah.score
puts blah.highest_score
puts blah.team
puts blah.count