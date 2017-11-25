configure do | c |
  c.directory = "examples/still/texts"
  c.file_name = "text2"
  c.format = :png
end

rectangle do | r |
  r.x = 300
  r.y = 100
  r.width = 100
  r.height = 100
end

text do | t |
  t.text = "GOOD"
  t.x = 300
  t.y = 100
  t.width = 100
  t.height = 100
end

rectangle do | r |
  r.x = 100
  r.y = 350
  r.width = 100
  r.height = 100
  r.fill_color = "red"
end

text do | t |
  t.text = "HAPPY"
  t.x = 100
  t.y = 350
  t.width = 100
  t.height = 100
end
