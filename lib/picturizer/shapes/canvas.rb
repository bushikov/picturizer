module Picturizer
  module Shapes
    class Canvas
      attr_accessor :width, :height

      def initialize
        @width = 500
        @height = 500
      end

      def body
        Magick::Image.new( width, height )
      end
    end
  end
end
