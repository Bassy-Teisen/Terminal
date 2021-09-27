require 'json'

data = File.read('scores.json')
parsed = JSON.parse(data, symbolize_names: true)
p parsed[0] << {:bass => 78}

File.write('scores.json'. JSON.dump(parsed))