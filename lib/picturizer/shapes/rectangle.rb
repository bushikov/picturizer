module Picturizer
  module Shapes
    class Rectangle < Base
      register_parameters :width, :height

      def initialize
        @height = 0
        @width = 0
      end

      def draw( canvas, time )
        draw_object( time ).rectangle( x( time ),
                                       y( time ),
                                       x( time ) + @width,
                                       y( time ) + @height ).draw( canvas )
      end

      def draw_object( time )
        obj = magick_draw_object

        obj.stroke( stroke_color( time ) )
        obj.stroke_linecap( stroke_linecap( time ) )
        obj.stroke_linejoin( stroke_linejoin( time ) )
        obj.stroke_width( stroke_width( time ) )
        obj.fill( fill_color( time ) )
        obj.stroke_opacity( stroke_opacity( time ) )
        obj.fill_opacity( fill_opacity( time ) )
      end
    end
  end
end
