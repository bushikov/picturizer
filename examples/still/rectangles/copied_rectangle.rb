configure do | c |
  c.directory = "./examples/still/rectangles"
  c.file_name = "copied_rectangle"
end

rectangle( "rec1" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "orange"
  r.x = 100
  r.y = 100
end

rectangle( "rec2", copy: "rec1" ) do | r |
  r.fill_color = "black"
  r.x = 300
  r.y = 100
end
