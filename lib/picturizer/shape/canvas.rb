module Picturizer
  module Shape
    class Canvas
      attr_accessor :width,
                    :height,
                    :bg_color

      def initialize
        @width = 500
        @height = 500
        @bg_color = "white"
      end

      def frame
        grad = Magick::GradientFill.new( 0, 0,
                                         width, height,
                                         bg_color, bg_color )
        Magick::Image.new( width, height, grad )
      end
    end
  end
end
