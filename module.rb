# Инспекция
module Inspectable

    # @return [String]
    def method_origin(method_name, visibility = :all)
        return @result if defined? @result
        chain = []
        @results = []
        ObjectSpace.each_object(Class) do |cls|
            case visibility
            when :public
                chain << cls if cls.instance_methods(false).include?(method_name)
            when :private
                chain << cls if cls.private_instance_methods(false).include?(method_name)
            when :protected
                chain << cls if cls.protected_instance_methods(false).include?(method_name)
            when :all
                chain << cls if cls.instance_methods(false).include?(method_name) || cls.private_instance_methods(false).include?(method_name) || cls.protected_instance_methods(false).include?(method_name)
            end
        end

        sorted_chain = chain.sort_by { |c| c.ancestors.size }

        sorted_chain.each do |cls|
            if cls.instance_methods(false).include?(method_name)
                vis = "публичный"
            elsif cls.private_instance_methods(false).include?(method_name)
                vis = "приватный"
            elsif cls.protected_instance_methods(false).include?(method_name)
                vis = "защищенный"
            end

            status = if cls.superclass && (cls.superclass.instance_methods(true).include?(method_name) || cls.superclass.private_instance_methods(true).include?(method_name) || cls.superclass.protected_instance_methods(true).include?(method_name))
                       "переопределен"
                     else
                       "определен"
                     end

            if status == "переопределен"
                output_line = "#{cls.name}##{method_name} < #{cls.superclass.name} — #{status}, #{vis}"
            else
                output_line = "#{cls.name}##{method_name} — #{status}, #{vis}"
            end


            @results << "#{cls.name}##{method_name}: #{vis}, #{status}"
        end
        @result = @results.join(" ")
        return @result
    end
end
