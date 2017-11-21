configure do | c |
  c.directory = "examples/still/texts"
  c.file_name = "text"
  c.format = :png
end

text do | t |
  t.text = "HELLO WORLD"
  t.x = 200
  t.y = 200
  t.width = 100
  t.height = 100
end
