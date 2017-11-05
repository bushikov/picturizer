configure do | c |
  c.directory = "./examples/moving/rectangles"
  c.file_name = "rectangle_acting_two_things_simultaneously"
end

rectangle( "rec" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "orange"
end

rec.move( from: [ 0, 0 ], to: [ 400, 400 ] ).between( from: 0, to: 2000 ).while.fading_out
