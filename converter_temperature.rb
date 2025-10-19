require './classes.rb'

if ARGV.length != 2
  puts "Использование: ruby converter_temperature.rb <celsius> <fahrenheit>"
  exit 1
end

celsius = ARGV[0].to_i
fahrenheit = ARGV[1].to_f
puts Temperature.new(celsius: celsius).fahrenheit
puts Temperature.new(fahrenheit: fahrenheit).celsius
