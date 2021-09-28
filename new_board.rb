require 'csv'

results = CSV.parse(File.read("filename.csv"), headers: true)
p results["score"]

