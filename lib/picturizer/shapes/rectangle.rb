module Picturizer
  module Shapes
    class Rectangle
      attr_accessor :x,
                    :y,
                    :height,
                    :width,
                    :stroke_color,
                    :stroke_linecap,
                    :stroke_linejoin,
                    :stroke_opacity,
                    :stroke_width,
                    :fill_opacity

      def initialize
        @stroke_color = "black"
        @stroke_linecap = "butt"
        @stroke_linejoin = "miter"
        @stroke_opacity = 1
        @stroke_width = 1
        @fill_opacity = 0

        @x = 0
        @y = 0
        @height = 0
        @width = 0
      end

      def draw( canvas, time )
        draw_object.rectangle( @x, @y, @x + @width, @y + @height ).draw( canvas )
      end

      def draw_object
        return @draw_object if @draw_object

        @draw_object = Magick::Draw.new
        @draw_object.stroke( stroke_color )
        @draw_object.stroke_linecap( stroke_linecap )
        @draw_object.stroke_linejoin( stroke_linejoin )
        @draw_object.stroke_opacity( stroke_opacity )
        @draw_object.stroke_width( stroke_width )
        @draw_object.fill_opacity( fill_opacity )
        @draw_object
      end
    end
  end
end
