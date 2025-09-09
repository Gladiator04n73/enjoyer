require './classes.rb'
require './module.rb'

dog = Dog.new('Собака', 'Лабрадор')
eagle = Eagle.new('Орел', "летает", "0.5")
debugger_dog = Debugger.new(dog)
puts dog.info
debugger_dog.inspect_method(:info)
debugger_eagle = Debugger.new(eagle)
puts eagle.info
debugger_eagle.inspect_method(:info)

