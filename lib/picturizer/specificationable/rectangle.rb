require "picturizer/specificationable/equipment"

module Picturizer
  module Specificationable
    module Rectangle
      extend Equipment

      add_shape_method( :rectangle, :new_rectangle )

      private
        def new_rectangle
          Picturizer::Shape::Rectangle.new
        end
    end
  end
end
