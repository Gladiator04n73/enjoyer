require './classes.rb'
require './module.rb'

cat = Cat.new(name: 'Кот')
bird = Bird.new(name: 'Птица', can_fly: true)
dog = Dog.new(name: 'Собака', breed: 'Лабрадор')
eagle = Eagle.new(name: 'Орёл', can_fly: true, wingspan: 2.5)


p cat.info
p bird.info
p dog.info
p eagle.info

p cat.method_origin(:info)

puts dog.send(:sing)
puts eagle.send(:sing)