configure do | c |
  c.directory = "examples/still/texts"
  c.file_name = "text"
  c.format = :png
end

rectangle do | r |
  # r.fill_opacity = 0
  r.x = 100
  r.y = 100
  r.width = 100
  r.height = 100
end

text do | t |
  t.text = "HELLO WORLD"
  t.x = 100
  t.y = 100
  t.width = 100
  t.height = 100
end

