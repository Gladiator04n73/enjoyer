# Импортирование библиотеки 'digest'
require 'digest'
# Студент
class Student


# Имя.
# @return [String]
attr_accessor :first_name


# Фамилия.
# @return [String]
attr_accessor :last_name


# Отчество.
# @return [String]
attr_accessor :middle_name


# Инициализация студента
def initialize(attrs = {})
  attrs.each { |k, v| public_send("#{k}=", v) }
end

# Мемоизированные атрибуты с использованием defined?


# Полное имя из #{last_name}, #{first_name} и #{middle_name}
# @return [String]
def full_name
  return @full_name if defined? @full_name
  @full_name = "#{last_name} #{first_name} #{middle_name}".strip
end


# @return [String, nil]
  def id
    return @id if defined? @id
    @id = generate_student_id(first_name, last_name, middle_name)
  end

  # Генерируем идентификатор зачетки.
  # @param [String] first_name Имя.
  # @param [String] last_name Фамилия.
  # @param [String] middle_name Отчество.
  # @return [Integer] Например, <tt>214151</tt>.
  def generate_student_id(first_name, last_name, middle_name)
    # Создаем хеш на основе ФИО
    data = "#{@first_name}#{@last_name}#{@middle_name}".downcase
    hash = Digest::MD5.hexdigest(data)
    numeric_part = hash[0...8].to_i(16) % 100000000
    "ST#{numeric_part.to_s.rjust(8, '0')}"
  end


end
a=Student.new.id
p a