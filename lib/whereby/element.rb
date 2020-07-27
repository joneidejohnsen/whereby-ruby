module Whereby
  class Element
    def initialize(attrs = {})
      # Only set attributes if the method exists
      attrs.each{ |k,v| send("#{k.underscore}=", v) if respond_to?("#{k.underscore}") }
    end

    def to_h
      Hash[
          *instance_variables.map do |variable|
            name = variable[1..-1].to_sym #Removing @
            [name, instance_variable_get(variable)]
          end.flatten
      ]
    end
  end
end