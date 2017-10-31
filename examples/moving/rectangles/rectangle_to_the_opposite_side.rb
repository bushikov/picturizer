configure do | c |
  c.directory = "./examples/moving"
  c.file_name = "rectangle_to_the_opposite_side"
  c.format = :gif
  c.interval = 2
  c.ticks_per_second = 100
end

rectangle( "rec" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "red"
end

rec.move( from: [ 0, 0 ], to: [ 400, 400 ] ).between( from: 0, to: 2000 )
