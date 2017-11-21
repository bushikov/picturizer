module Picturizer
  module Component
    module Text
      class << self
        def draw( canvas, parameters )
          draw_object( parameters ).annotate(
            canvas,
            parameters.width,
            parameters.height,
            parameters.x,
            parameters.y,
            parameters.text ) do
              self.gravity = parameters.gravity
              self.pointsize = parameters.font_size
              self.fill = parameters.color
            end
        end

        def draw_object( parameters )
          magick_draw_object
        end

        def magick_draw_object
          Magick::Draw.new
        end
      end
    end
  end
end
