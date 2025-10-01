require './classes.rb'
require './module.rb'

# Создаем экземпляры
cat = Cat.new(name: 'Мурка')
bird = Bird.new(name: 'Птица', can_fly: true)
dog = Dog.new(name: 'Собака', breed: 'Лабрадор')
eagle = Eagle.new(name: 'Орёл', can_fly: true, wingspan: 2.5)

# Вызываем методы
puts cat.info     # Животное: Мурка, кот
puts dog.info     # Животное: Шарик, порода: Лабрадор
puts bird.info    # Животное: Воробей, птица, летает,
puts eagle.info   # Животное: Орёл, птица, летает, размах крыльев: 2.5 м

# Используем модуль для инспекции
puts "Полная цепочка происхождения метода info:"
puts cat.method_origin(:info, :all, :chain)
puts "Метод info впервые определен:"
puts cat.method_origin(:info, :all, :first_chain)
puts "Метод info впервые переопределен в последний раз:"
puts cat.method_origin(:info, :all, :last_chain)
