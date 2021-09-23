class Leaderboard
    attr_reader :score, :team
    attr_accessor :highest_score
    def initialize(team)
        @team = team
        @highest_score = 0
        @score = []
    end
    def winner(score)
        @score << score 
    end
    def clac
       @score.each do |key, value|
           
        if value > @highest_score
        @highest_score = value
       
        end
    end
    end
end
team = Leaderboard.new("bassy")

team.winner({:bassy => "1"}) 
team.winner({:bassy => "1"}) 
team.winner({:bassy => "2"}) 
p team.score
p team.highest_score
