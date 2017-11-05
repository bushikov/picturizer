configure do | c |
  c.directory = "./examples/still/rectangles"
  c.file_name = "colored_rectangle"
  c.format = :png
end

canvas do | c |
  c.width = 500
  c.height = 500
end

# not framed red rectangle
rectangle do | r |
  r.x = 100
  r.y = 100
  r.width = 100
  r.height = 100
  r.fill_color = "red"
  r.stroke_color = "red"
end

# framed lime rectangle
rectangle do | r |
  r.x = 300
  r.y = 100
  r.width = 100
  r.height = 100
  r.fill_color = "rgb( 0, 255, 0 )"
end

# framed turquoise rectangle
rectangle do | r |
  r.x = 300
  r.y = 200
  r.width = 100
  r.height = 100
  r.fill_color = "turquoise"
end

# framed blue rectangle
rectangle do | r |
  r.x = 200
  r.y = 200
  r.width = 100
  r.height = 100
  r.fill_color = "#0000FF"
end
