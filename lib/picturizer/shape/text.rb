module Picturizer
  module Shape
    class Text < Base
      register_parameters :width,
                          :height,
                          :text,
                          :gravity,
                          :font_size,
                          :color

      def initialize
        @height = 100
        @width = 100
        @text = ""
        @gravity = Magick::CenterGravity
        @font_size = 14
        @color = "black"
      end

      def draw( canvas, time )
        Picturizer::Component::Text.draw( canvas,
                                          parameters( time ) )
      end
    end
  end
end
