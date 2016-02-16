require 'json'

data = File.read('data.txt')
json = JSON.parse(data)

p json
