module Picturizer
  module Component
    module Rectangle
      class << self
        def draw( canvas, parameters )
          draw_object( parameters ).rectangle(
            parameters.x,
            parameters.y,
            parameters.x + parameters.width,
            parameters.y + parameters.height ).draw( canvas )
        end

        def draw_object( parameters )
          obj = magick_draw_object

          obj.stroke( parameters.stroke_color )
          obj.stroke_linecap( parameters.stroke_linecap )
          obj.stroke_linejoin( parameters.stroke_linejoin )
          obj.stroke_width( parameters.stroke_width )
          obj.fill( parameters.fill_color )
          obj.stroke_opacity( parameters.stroke_opacity )
          obj.fill_opacity( parameters.fill_opacity )
        end

        def magick_draw_object
          Magick::Draw.new
        end
      end
    end
  end
end
