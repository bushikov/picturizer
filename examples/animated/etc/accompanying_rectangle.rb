configure do | c |
  c.directory = "examples/animated/etc"
  c.file_name = "accompanying_rectangle"
  c.format = :png
end

rectangle( :rec1 ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "orange"
end

rectangle( :rec2, copy: :rec1 ) do | r |
  r.fill_color = "red"
end

rec1.move( from: [ 0, 0 ], to: [ 300, 0 ] ).between( from: 0, to: 2000 )
rec2.accompany( rec1, offset_x: 100, offset_y: 200 )
