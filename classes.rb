require './module.rb'
class Animal
    attr_accessor :name
    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end
    def info
        "Животное: #{@name},"
    end
    def ancestry
        puts self.class.ancestors.reverse.join(' -> ')
    end
end
class Mammal < Animal
    attr_accessor :warm_blooded
    def initialize(attrs = {})
        super(attrs)
        attrs.each { |k, v| public_send("#{k}=", v) }
    end
    def info
        super + " млекопитающее,"
    end
end
class Bird < Animal
    attr_accessor :can_fly 
    def initialize(attrs = {})
        super(attrs)
        attrs.each { |k, v| public_send("#{k}=", v) }
    end
    def info
        if @can_fly 
            super + " птица, летает,"
        else
            super + " птица, не летает,"
        end
    end
end
class Dog < Mammal
    attr_accessor :breed 
    def initialize(attrs = {})
        super(attrs)
        attrs.each { |k, v| public_send("#{k}=", v) }
    end
    def info
        super + " порода: #{@breed}"
    end
end
class Eagle < Bird
    attr_accessor :wingspan  
    def initialize(attrs = {})
        super(attrs)
        attrs.each { |k, v| public_send("#{k}=", v) }
    end
    def info
        super + " размах крыльев: #{@wingspan} м"
    end
end
class Debugger
    include Inspectable

    attr_accessor :object

    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    def inspect_method(method_name)
        @object.extend(Inspectable)
        @object.method_origin(method_name)
    end
end
