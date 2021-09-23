class Leaderboard
    attr_reader :score 
    attr_accessor :highest_score
    def initialize(team)
        @team = team
        @score = score_builder
        @highest_score = []
    end
    def score_builder
    {
        @team => {
            1=>0,
            2=>0,
            3=>0,
            4=>0
        }
    }
    end
    def generate_total
# generates toatl with .values.inject(&:+)
        @score[@team].values.inject(&:+)
    end
    def add_run(blahs)
        # p inning.class 
        @score[@team][blahs] 
    end
    
    def clac 
    @team.score.each do |key, value|
    if key == "bassy"
    p value[2]
   
    end
    end
    end  
end
team = Leaderboard.new("bassy")

p team.add_run(1) 

team.add_run inning: 2
team.add_run inning: 3
team.add_run inning: 4
team.generate_total
p team
p score
p @highest_score
    


#   describe "Leaderboard" do 
#     it "should properly calculate the total score for a team" do
#         team = Leaderboard.new('blah1')
#         team.add_run inning: 1
#         team.add_run inning: 7
#         team.add_run inning: 9
#         expect(team.generate_total).to eq(3)
#     end
#   describe "Leaderboard" do 
#     it "should properly calculate the total score for a team" do
#         team = Leaderboard.new('blah1')
#         team.add_run inning: 1
#         team.add_run inning: 7
#         team.add_run inning: 9
#         team.add_run inning: 9
#         expect(team.generate_total).to eq({'blah'=>{1=>0, 2=>0, 3=>0, 4=>0}})
#     end
#     it 'should generate a has with the innings and 0 vlues for the runs each inning when a Scoreboard is created' do
#         team = Leaderboard.new('blah')
#         expect(team.score).to eq({"blah"=>{1=>0, 2=>0, 3=>0, 4=>0}})
#     end
# end
# end
# team.add_run inning: 2
# team.add_run inning: 2
# team.add_run inning: 2
# team.add_run inning: 1
# team.generate_total
# p team.score
