
module Inspectable
    def method_origin(method_name)
        method=self.method(method_name)
        origin=method.owner
        puts "Метод '#{method_name}' определён в: #{origin}"
        if origin.is_a?(Class)
            puts "Родословная класса: #{origin.ancestors.join(' -> ')}"
        end
    end
end