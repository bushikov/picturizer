configure do | c |
  c.directory = "examples/animated/etc"
  c.file_name = "move_simultaneously"
end

rectangle( :rec1 ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "orange"
end

rectangle( :rec2, copy: :rec1 ) do | r |
  r.fill_color = "black"
end

rec1.move( from: [ 0, 0 ], to: [ 0, 400 ] ).starting( 0 ).for( 2000 )
rec2.move( from: [ 200, 0 ], to: [ 200, 400 ] ).simultaneously_with( rec1 )
