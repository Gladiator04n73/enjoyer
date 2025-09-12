require './classes.rb'
require './module.rb'

dog = Dog.new(name: 'Собака', breed: 'Лабрадор', warm_blooded: true)
eagle = Eagle.new(name: 'Орел', can_fly: true, wingspan: 0.5)
debugger_dog = Debugger.new(object: dog)
puts dog.info
debugger_dog.inspect_method(:info)
debugger_eagle = Debugger.new(object: eagle)
puts eagle.info
debugger_eagle.inspect_method(:info)

