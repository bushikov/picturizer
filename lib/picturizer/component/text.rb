module Picturizer
  module Component
    module Text
      class << self
        def draw( canvas, parameters )
            draw_object( parameters ).text(
              offset_x( parameters ),
              offset_y( parameters ),
              parameters.text ).draw( canvas )
        end

        def draw_object( parameters )
          obj = magick_draw_object

          obj.gravity( parameters.gravity )
          obj.pointsize = parameters.font_size
          obj.fill( parameters.color )
          obj.fill_opacity( parameters.fill_opacity )
        end

        def magick_draw_object
          Magick::Draw.new
        end

        def offset_x( parameters )
          ( parameters.x + parameters.width / 2 ) \
            - ( parameters.canvas_width / 2 )
        end

        def offset_y( parameters )
          ( parameters.y + parameters.height / 2 ) \
            - ( parameters.canvas_height / 2 )
        end
      end
    end
  end
end
