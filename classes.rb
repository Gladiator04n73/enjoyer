require './module.rb'
include Inspectable

# Животное
class Animal

    # Имя.
    # @return [String]
    attr_accessor :name

    # Сообщение.
    # @return [String]
    attr_accessor :message

    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    # Информация о животном {#name}.
    # @return [String]
    def info
        return @message if defined? @message
        @message = "Животное: #{@name},"
    end

end

# Кот
class Cat < Animal
    
        def initialize(attrs = {})
            attrs.each { |k, v| public_send("#{k}=", v) }
        end

        # Информация о коте.
        # @return [String]
        def info
            return @message if defined? @message
            @message = super + " кот"
        end
        
        private

        # @return [String]
        def meow
            return @message if defined? @message
            @message = 'Делает мяу'
        end

end

# Птица
class Bird < Animal

    # Способность летать.
    # @return [Boolean]
    attr_accessor :can_fly

    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    # Информация о птице.
    # @return [String]
    def info
        return @message if defined? @message
        if @can_fly
            @message = super + " птица, летает,"
        else
            @message = super + " птица, не летает,"
        end
    end

end

# Собака
class Dog < Animal

    # Порода.
    # @return [String]
    attr_accessor :breed
    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    # Информация о собаки.
    # @return [String]
    def info
        return @message if defined? @message
        @message = super + " порода: #{@breed}"
    end

    private

    # @return [String]
    def sing
        return @message if defined? @message
        @message = 'Делает гав'
    end

end
# Орел
class Eagle < Bird

    # Размах крыльев.
    # @return [String]
    attr_accessor :wingspan

    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    # Информация об орле.
    # @return [String]
    def info
        return @message if defined? @message
        @message = super + " размах крыльев: #{@wingspan} м"
    end

    private

    # @return [String]
    def sing
        return @message if defined? @message
        @message = 'Кар!'
    end

end
