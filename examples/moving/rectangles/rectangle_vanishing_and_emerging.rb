configure do | c |
  c.directory = "./examples/moving/rectangles"
  c.file_name = "rectangle_vanishing_and_emerging"
end

rectangle( "rec" ) do | r |
  r.width = 200
  r.height = 200
  r.x = 100
  r.y = 100
  r.fill_color = "lime"
end

rec.vanish.at( 1000 )
rec.emerge.at( 2000 )
rec.vanish.at( 3000 )
rec.emerge.at( 3500 )
