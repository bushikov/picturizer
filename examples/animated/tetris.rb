configure do | c |
  c.directory = "./examples/animated"
  c.file_name = "tetris"
  c.interval = 25
  # c.format = :png
end

canvas do | c |
  c.background_color = "black"
end

rectangle( "z1" ) do | r |
  r.width = 50
  r.height = 50
end

rectangle( "a1_1" ) do | r |
  r.width = 50
  r.height = 50
  r.x = 550
  r.y = 550
  r.fill_color = "orange"
end
rectangle( "a1_2", copy: "a1_1" )
rectangle( "a1_3", copy: "a1_1" )
rectangle( "a1_4", copy: "a1_1" )

rectangle( "b1_1", copy: "a1_1" ) do | r |
  r.fill_color = "red"
end
rectangle( "b1_2", copy: "b1_1" )
rectangle( "b1_3", copy: "b1_1" )
rectangle( "b1_4", copy: "b1_1" )

rectangle( "c1_1", copy: "a1_1" ) do | r |
  r.fill_color = "white"
end
rectangle( "c1_2", copy: "c1_1" )
rectangle( "c1_3", copy: "c1_1" )
rectangle( "c1_4", copy: "c1_1" )

rectangle( "d1_1", copy: "a1_1" ) do | r |
  r.fill_color = "black"
end
rectangle( "d1_2", copy: "d1_1" )
rectangle( "d1_3", copy: "d1_1" )
rectangle( "d1_4", copy: "d1_1" )

rectangle( "c2_1", copy: "c1_1" )
rectangle( "c2_2", copy: "c1_1" )
rectangle( "c2_3", copy: "c1_1" )
rectangle( "c2_4", copy: "c1_1" )

rectangle( "b2_1", copy: "b1_1" )
rectangle( "b2_2", copy: "b1_1" )
rectangle( "b2_3", copy: "b1_1" )
rectangle( "b2_4", copy: "b1_1" )

z1.move( from: [ 0, 0 ], to: [ 450, 0 ] ).between( from: 0, to: 11500 )

a1_1.move( from: [ 250, 50 ], to: [ 50, 250 ] ).between( from: 0, to: 1000 )
a1_2.move( from: [ 250, 100 ], to: [ 50, 300 ] ).between( from: 0, to: 1000 )
a1_3.move( from: [ 250, 150 ], to: [ 50, 350 ] ).between( from: 0, to: 1000 )
a1_4.move( from: [ 250, 200 ], to: [ 50, 400 ] ).between( from: 0, to: 1000 )

b1_1.move( from: [ 250, 50 ], to: [ 150, 350 ] ).between( from: 1500, to: 2500 )
b1_2.move( from: [ 200, 100 ], to: [ 100, 400 ] ).between( from: 1500, to: 2500 )
b1_3.move( from: [ 250, 100 ], to: [ 150, 400 ] ).between( from: 1500, to: 2500 )
b1_4.move( from: [ 300, 100 ], to: [ 200, 400 ] ).between( from: 1500, to: 2500 )

c1_1.move( from: [ 200, 50 ], to: [ 250, 350 ] ).between( from: 3000, to: 4000 )
c1_2.move( from: [ 250, 50 ], to: [ 300, 350 ] ).between( from: 3000, to: 4000 )
c1_3.move( from: [ 200, 100 ], to: [ 250, 400 ] ).between( from: 3000, to: 4000 )
c1_4.move( from: [ 250, 100 ], to: [ 300, 400 ] ).between( from: 3000, to: 4000 )

d1_1.move( from: [ 200, 50 ], to: [ 350, 300 ] ).between( from: 4500, to: 5500 )
d1_2.move( from: [ 250, 50 ], to: [ 400, 300 ] ).between( from: 4500, to: 5500 )
d1_3.move( from: [ 250, 100 ], to: [ 400, 350 ] ).between( from: 4500, to: 5500 )
d1_4.move( from: [ 250, 150 ], to: [ 400, 400 ] ).between( from: 4500, to: 5500 )

c2_1.move( from: [ 250, 50 ], to: [ 100, 250 ] ).between( from: 6000, to: 7000 )
c2_2.move( from: [ 300, 50 ], to: [ 150, 250 ] ).between( from: 6000, to: 7000 )
c2_3.move( from: [ 250, 100 ], to: [ 100, 300 ] ).between( from: 6000, to: 7000 )
c2_4.move( from: [ 300, 100 ], to: [ 150, 300 ] ).between( from: 6000, to: 7000 )

b2_1.move( from: [ 250, 50 ], to: [ 250, 250 ] ).between( from: 7500, to: 8500 )
b2_2.move( from: [ 200, 100 ], to: [ 200, 300 ] ).between( from: 7500, to: 8500 )
b2_3.move( from: [ 250, 100 ], to: [ 250, 300 ] ).between( from: 7500, to: 8500 )
b2_4.move( from: [ 300, 100 ], to: [ 300, 300 ] ).between( from: 7500, to: 8500 )

a1_2.fade_out.between( from: 9000, to: 9500 )
c2_3.fade_out.between( from: 9000, to: 9500 )
c2_4.fade_out.between( from: 9000, to: 9500 )
b2_2.fade_out.between( from: 9000, to: 9500 )
b2_3.fade_out.between( from: 9000, to: 9500 )
b2_4.fade_out.between( from: 9000, to: 9500 )
d1_1.fade_out.between( from: 9000, to: 9500 )
d1_2.fade_out.between( from: 9000, to: 9500 )

a1_1.move( from: [ 50, 250 ], to: [ 50, 300 ] ).between( from: 10000, to: 10500 )
c2_1.move( from: [ 100, 250 ], to: [ 100, 350 ] ).between( from: 10000, to: 11000 )
c2_2.move( from: [ 150, 250 ], to: [ 150, 300 ] ).between( from: 10000, to: 10500 )
b2_1.move( from: [ 250, 250 ], to: [ 250, 300 ] ).between( from: 10000, to: 10500 )
