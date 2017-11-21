module Picturizer
  module Shape
    class Rectangle < Base
      register_parameters :width, :height

      def initialize
        @height = 100
        @width = 100
      end

      def draw( canvas, time )
        Picturizer::Component::Rectangle.draw( canvas,
                                               parameters( time ) )
      end
    end
  end
end
