require 'csv'

# CSV.foreach('people.csv', headers: true, header_converters: :symbol) do |row|
#     p row[:name]
# end

CSV.open('people.csv', 'a') do |csv|
    csv << ['Bassy5', 777]
end 

