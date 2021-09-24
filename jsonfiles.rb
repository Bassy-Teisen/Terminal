require 'json'

data = File.read('scores.json')
parsed = JSON.parse(data, symbolize_names: true)
p parsed << {:bass => 78}

