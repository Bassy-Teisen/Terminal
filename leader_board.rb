require "colorize"
require 'json'
class Tally
    attr_reader :hash
    attr_accessor :container, :b
    def initialize
      @b = []
    #   data = File.read('scores.json')
      @container = ["score1":89, "score2":78, "score4":4, "score5":1, "score3":1]
      @hash 
    end
    def check(hash)
      @hash = hash
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
      puts @b
      puts "Top score belongs to: ".cyan.bold + "#{sc.keys[0]} ".red.bold + "the score is: ".cyan.bold + "#{sc.values[0]}".red.bold 
    end
  end
  
  game1 = GameTally.new
  game1.check(bassy: 77)
  game1.reciever
   

  
#   File.write('scores.json'. JSON.dump())
 
  
  require 'csv'
  CSV.open('people.csv', 'a') do |csv|
    csv << [game1.hash.keys[0], game1.hash.values[0]]
  end 

