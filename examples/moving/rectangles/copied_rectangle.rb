configure do | c |
  c.directory = "./examples/moving/rectangles"
  c.file_name = "copied_rectangle"
end

rectangle( "rec1" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "orange"
end

rectangle( "rec2", copy: "rec1" ) do | r |
  r.fill_color = "black"
end

rec1.move( from: [ 0, 0 ], to: [ 100, 100 ] ).between( from: 0, to: 1000 )
rec2.move( from: [ 0, 0 ], to: [ 0, 100 ] ).between( from: 0, to: 1000 )
