require 'csv'
require 'smarter_csv'




data = SmarterCSV.process( "filename.csv" ) 
 
p data
foo = {:name=>"bassy", :score=>10, :game=>"game"}
blah = foo.values[1]

def converter(input,new_result, var)
    input.each do |hash|
         val = hash[:score]
         val = val.to_i
         p val   
         if val < new_result
            return var
            else
                next
            end     
        end
end
x = converter(data,blah,foo)

data << x

p data

    
