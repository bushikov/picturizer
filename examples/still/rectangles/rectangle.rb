configure do | c |
  c.directory = "./examples/still"
  c.file_name = "rectangle"
  c.format = :png
end

canvas do | c |
  c.width = 700
  c.height = 700
end

rectangle do | r |
  r.x = 100
  r.y = 100
  r.width = 100
  r.height = 100
end

rectangle do | r |
  r.x = 300
  r.y = 100
  r.width = 200
  r.height = 400
end
