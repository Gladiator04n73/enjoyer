# Представление входной температуры в нужном нам формате.
class Temperature
    
    # Градус Цельсия.
    # @return [Integer]
    attr_writer :celsius

    # Градус Фаренгейта.
    # @return [Float]
    attr_writer :fahrenheit
    

    def initialize(attrs = {})
        attrs.each { |k, v| public_send("#{k}=", v) }
    end

    # @return [Integer]
    def celsius
        return @celsius if defined? @celsius
        @celsius = ((fahrenheit - 32) / 1.8).to_i
    end

    # @return [Float]
    def fahrenheit
        return @fahrenheit if defined? @fahrenheit
        @fahrenheit = ((celsius * 1.8) + 32).round(2)
    end

end