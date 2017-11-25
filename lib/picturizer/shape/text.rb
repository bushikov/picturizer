module Picturizer
  module Shape
    class Text < Base
      register_parameters :width,
                          :height,
                          :canvas_width,
                          :canvas_height,
                          :text,
                          :gravity,
                          :font_size,
                          :color

      def initialize( canvas_w, canvas_h )
        @height = 100
        @width = 100
        @canvas_width = canvas_w
        @canvas_height = canvas_h
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
