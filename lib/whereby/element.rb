module Whereby
  class Element
    def initialize(attrs = {})
      # Only set attributes if the method exists
      attrs.each{ |k,v| send("#{k.whereby_underscore}=", v) if respond_to?(k.whereby_underscore.to_s) }
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