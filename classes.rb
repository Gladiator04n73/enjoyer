require './module.rb'
class Animal
    attr_reader :name
    def initialize(name)
        @name=name
    end
    def info
        "Животное: #{@name},"
    end
    def ancestry
        puts self.class.ancestors.reverse.join(' -> ')
    end
end
class Mammal < Animal
    attr_reader :warm_blooded
    def initialize(name, warm_blooded)
        super(name)
        @warm_blooded=warm_blooded
    end
    def info
        super + " млекопитающее,"
    end
end
class Bird < Animal
    attr_reader :can_fly 
    def initialize(name, can_fly )
        super(name)
        @can_fly =true
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
    attr_reader :breed 
    def initialize(name, breed )
        super(name, warm_blooded)
        @breed=breed
    end
    def info
        super + " порода: #{@breed}"
    end
end
class Eagle < Bird
    attr_reader :wingspan  
    def initialize(name, can_fly, wingspan)
        super(name, can_fly)
        @wingspan  = wingspan 
    end
    def info
        super + " размах крыльев: #{@wingspan} м"
    end
end
class Debugger
    include Inspectable

    def initialize(object)
        @object=object
    end

    def inspect_method(method_name)
        @object.extend(Inspectable)
        @object.method_origin(method_name)
    end
end