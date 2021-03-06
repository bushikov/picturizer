module Picturizer
  module Painter
    def self.draw( spec )
      ( 0 .. spec.end_time ).step( ( spec.config.interval.to_f / spec.config.ticks_per_second ) * 1000 ) do
        | current_time |

        canvas = spec.canvas_body.frame
        
        spec.shapes.each do | _, shape |
          shape.draw( canvas, current_time )
        end

        container.push( canvas )
      end

      container.ticks_per_second = spec.config.ticks_per_second
      container.delay = spec.config.interval
      container
    end

    def self.container
      @container ||= Magick::ImageList.new
    end
  end
end
