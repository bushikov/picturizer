# Confirm whether Magick::Image object can be reuse

require "rmagick"

canvas = Magick::Image.new( 100, 100 )

rectangle = Magick::Draw.new
rectangle.stroke( "black" )
rectangle.stroke_linecap( "butt" )
rectangle.stroke_linejoin( "miter" )
rectangle.stroke_opacity( 1 )
rectangle.stroke_width( 1 )
rectangle.fill_opacity( 0 )

rectangle.rectangle( 10, 10, 90, 90 ).draw( canvas )

# After resize!, picture including all the stuff on it will just be expanded or contracted.
canvas.resize!( 500, 500 )
canvas.erase!

rectangle.rectangle( 10, 10, 90, 90 ).draw( canvas )

canvas.display
