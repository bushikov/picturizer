require "picturizer/specificationable/equipment"

module Picturizer
  module Specificationable
    module Text
      extend Equipment

      add_shape_method( :text, :new_text )

      private
        def new_text
          Picturizer::Shape::Text.new( canvas_body.width,
                                       canvas_body.height )
        end
    end
  end
end
