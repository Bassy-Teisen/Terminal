require 'csv'
require 'smarter_csv'




data = SmarterCSV.process( "filename.csv" ) 
 
p data
foo = {:bassy => 10}
p foo.values[0]
def converter(input,new_result)
    input.each do |hash|
        hash.each do |key, val|
            val = val.to_i
            if val < new_result.values[0]
            return new_result
            else
                next
            end     
        end
    end
end
x = converter(data,foo)

data << x
p data