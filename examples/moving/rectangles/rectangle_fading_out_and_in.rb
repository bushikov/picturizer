configure do | c |
  c.directory = "./examples/moving"
  c.file_name = "rectangle_fading_out_and_in"
  c.format = :gif
end

rectangle( "rec" ) do | r |
  r.width = 200
  r.height = 200
  r.x = 100
  r.y = 100
  r.fill_color = "red"
end

rec.fade_out.for( 1000 ).starting( 500 )
rec.fade_in.for( 1000 ).starting( 2000 )
rec.fade_out.for( 1000 ).starting( 3500 )
