configure do | c |
  c.directory = "examples/animated/texts"
  c.file_name = "vanishing_text"
end

text( :text1 ) do | t |
  t.text = "Hello"
  t.font_size = 20
end

text1.vanish.at( 1000 )
text1.emerge.at( 2000 )
