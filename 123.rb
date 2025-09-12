# Импортирование библиотеки 'digest'
require 'digest'
# Класс Студента
class Student
# @param first_name [String] имя
# @param last_name [String] фамилия
# @param middle_name [String] отчество
  attr_accessor :first_name, :last_name, :middle_name

  def initialize(attrs = {})
    attrs.each { |k, v| public_send("#{k}=", v) }
  end

# Мемоизированные атрибуты с использованием defined?
  def full_name
# @return full_name если он определен, в противном случае full_name формируется из имени, фамилии и отчества
    return @full_name if defined? @full_name
    @full_name = "#{last_name} #{first_name} #{middle_name}".strip
  end
# @return student_id если он определен, в противном случае student_id генерируется методом generate_student_id
  def student_id
    return @student_id if defined? @student_id
    @student_id = generate_student_id
  end

  # Метод-функция для генерации номера зачетки
  def generate_student_id(first_name, last_name, middle_name)
    # Создаем хеш на основе ФИО
    data = "#{@first_name}#{@last_name}#{@middle_name}".downcase
    hash = Digest::MD5.hexdigest(data)

    # Берем первые 8 символов хеша и преобразуем в число
    # Затем форматируем как 8-значный номер зачетки
    numeric_part = hash[0...8].to_i(16) % 100000000
    "ST#{numeric_part.to_s.rjust(8, '0')}"
  end

end
