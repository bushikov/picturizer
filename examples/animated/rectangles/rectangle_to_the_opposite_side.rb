configure do | c |
  c.directory = "./examples/animated/rectangles"
  c.file_name = "rectangle_to_the_opposite_side"
  c.format = :gif
  c.interval = 20
end

rectangle( "rec" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "red"
end

rec.move( from: [ 0, 0 ], to: [ 400, 400 ] ).between( from: 0, to: 2000 )
