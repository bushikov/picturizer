configure do | c |
  c.directory = "examples/still/background"
  c.file_name = "colored"
  c.format = :png
end

canvas do | c |
  c.bg_color = "green"
end

rectangle do | r |
  r.width = 200
  r.height = 200
  r.x = 200
  r.y = 200
end
