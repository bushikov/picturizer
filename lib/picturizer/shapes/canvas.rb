module Picturizer
  module Shapes
    class Canvas
      attr_accessor :width,
                    :height,
                    :background_color

      def initialize
        @width = 500
        @height = 500
        @background_color = "white"
      end

      def body
        Magick::Image.new( width, height ){
          self.background_color = background_color
        }
      end
    end
  end
end
