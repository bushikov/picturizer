require "rmagick"

word = "HELLO WORLD"

canvas = Magick::Image.new( 500, 500, Magick::HatchFill.new( "white", "lightcyan2" ) )

rec = Magick::Draw.new
rec.fill( "black" )
rec.rectangle( 100, 0, 200, 50 ).draw( canvas )

rec2 = Magick::Draw.new
rec2.fill_opacity( 0 )
rec2.stroke( "black" )
rec2.rectangle( 100, 50, 400, 450 ).draw( canvas )

rec3 = Magick::Draw.new
rec3.fill( "black" )
rec3.fill_opacity( 0.3 )
rec3.rectangle( 200, 200, 300, 300 ).draw( canvas )

draw0 = Magick::Draw.new
draw0.gravity( Magick::CenterGravity )
draw0.text( 100, 100, "AAZZ+ZZAA" ).draw( canvas )

draw = Magick::Draw.new
# ********************************
draw.pointsize = 15
draw.fill( "red" )
draw.fill_opacity( 1 )

draw.gravity( Magick::NorthWestGravity )

# ********************************

draw.text( 200, 200, word )
# 100, 50 の位置を文字の左下に合わせて描画される

draw.draw( canvas )

canvas.display
