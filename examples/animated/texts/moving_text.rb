configure do | c |
  c.directory = "examples/animated/texts"
  c.file_name = "moving_text"
end

text( :text1 ) do | t |
  t.text = "HELLO"
  t.width = 50
  t.height = 50
end

text1.move( from: [ 100, 100 ], to: [ 300, 300 ] ).between( from: 0, to: 1000 )
