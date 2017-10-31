configure do | c |
  c.directory = "./examples/moving"
  c.file_name = "default_rectangle"
end

rectangle( "rec" )

rec.move( from: [ 0, 0 ] ,to: [ 200, 200 ] ).between( from: 0, to: 1000 )
