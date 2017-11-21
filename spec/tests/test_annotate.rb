require "rmagick"

word = "AAAAAZZqq+qqZZAAAAA"

canvas = Magick::Image.new( 500, 500,
           Magick::HatchFill.new( "white", "lightcyan2" ) )

rec = Magick::Draw.new
rec.fill_opacity( 0 )
rec.stroke( "black" )
rec.rectangle( 100, 100, 400, 400 ).draw( canvas )
rec.rectangle( 100, 100, 250, 250 ).draw( canvas )
rec.rectangle( 250, 250, 400, 400 ).draw( canvas )

rec2 = Magick::Draw.new
rec2.fill_opacity( 1 )
rec2.fill( "black" )
rec2.rectangle( 200, 200, 300, 300 ).draw( canvas )

draw = Magick::Draw.new

color = "yellow"

# Drawオブジェクトに対するメソッドを呼び出すことでは
# annotateに設定できない
#
# draw.gravity( Magick::CenterGravity )
# draw.pointsize = 14
# draw.fill( color )

draw.annotate( canvas, 300, 300, 100, 100, word ) do
  self.gravity = Magick::CenterGravity
  self.pointsize = 14
  self.fill = color
end

canvas.display
