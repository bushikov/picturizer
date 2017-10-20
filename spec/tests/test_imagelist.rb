

require "rmagick"

container = Magick::ImageList.new
canvas = Magick::Image.new( 500, 500 )

rectangle = Magick::Draw.new
rectangle.stroke( "black" )
rectangle.stroke_linecap( "butt" )
rectangle.stroke_linejoin( "miter" )
rectangle.stroke_opacity( 1 )
rectangle.stroke_width( 1 )
rectangle.fill_opacity( 0 )

rectangle.rectangle( 10, 10, 90, 90 ).draw( canvas )

container.push( canvas )

# The image object in image list is erased if followed command is executed
# canvas.erase!

container.display
