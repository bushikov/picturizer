configure do | c |
  c.directory = "examples/animated"
  c.file_name = "tetris3"
  c.interval = 250
end

rectangle( [ :a1_1, :a1_2, :a1_3, :a1_4 ] ) do | r |
  r.width = 50
  r.height = 50
  r.x = 550
  r.y = 550
  r.fill_color = "orange"
end

rectangle( [ :b1_1, :b1_2, :b1_3, :b1_4, :b2_1, :b2_2, :b2_3, :b2_4 ], copy: :a1_1 ) do | r |
  r.fill_color = "red"
end

rectangle( [ :c1_1, :c1_2, :c1_3, :c1_4, :c2_1, :c2_2, :c2_3, :c2_4 ], copy: :a1_1 ) do | r |
  r.fill_color= "white"
end

rectangle( [ :d1_1, :d1_2, :d1_3, :d1_4 ], copy: :a1_1 ) do | r |
  r.fill_color = "blue"
end

rectangle( :z1, copy: :a1_1 )

a1_1.move( from: [ 250, 50 ], to: [ 50, 250 ] ).between( from: 0, to: 1000 )
a1_2.accompany( a1_1, offset_y: 50 )
a1_3.accompany( a1_1, offset_y: 100 )
a1_4.accompany( a1_1, offset_y: 150 )

b1_1.move( from: [ 250, 50 ], to: [ 150, 350 ] ).between( from: 1500, to: 2500 )
b1_2.accompany( b1_1, offset_x: -50, offset_y: 50 )
b1_3.accompany( b1_1, offset_y: 50 )
b1_4.accompany( b1_1, offset_x: 50, offset_y: 50 )

c1_1.move( from: [ 200, 50 ], to: [ 250, 350 ] ).between( from: 3000, to: 4000 )
c1_2.accompany( c1_1, offset_x: 50 )
c1_3.accompany( c1_1, offset_y: 50 )
c1_4.accompany( c1_1, offset_x: 50, offset_y: 50 )

d1_1.move( from: [ 200, 50 ], to: [ 350, 300 ] ).between( from: 4500, to: 5500 )
d1_2.accompany( d1_1, offset_x: 50 )
d1_3.accompany( d1_1, offset_x: 50, offset_y: 50 )
d1_4.accompany( d1_1, offset_x: 50, offset_y: 100 )

c2_1.move( from: [ 250, 50 ], to: [ 100, 250 ] ).between( from: 6000, to: 7000 )
c2_2.accompany( c2_1, offset_x: 50 )
c2_3.accompany( c2_1, offset_y: 50 )
c2_4.accompany( c2_1, offset_x: 50, offset_y: 50 )

b2_1.move( from: [ 250, 50 ], to: [ 250, 250 ] ).between( from: 7500, to: 8500 )
b2_2.accompany( b2_1, offset_x: -50, offset_y: 50 )
b2_3.accompany( b2_1, offset_y: 50 )
b2_4.accompany( b2_1, offset_x: 50, offset_y: 50 )

a1_2.fade_out.between( from: 9000, to: 9500 )
c2_3.fade_out.between( from: 9000, to: 9500 )
c2_4.fade_out.between( from: 9000, to: 9500 )
b2_2.fade_out.between( from: 9000, to: 9500 )
b2_3.fade_out.between( from: 9000, to: 9500 )
b2_4.fade_out.between( from: 9000, to: 9500 )
d1_1.fade_out.between( from: 9000, to: 9500 )
d1_2.fade_out.between( from: 9000, to: 9500 )

a1_1.move( from: [ 50, 250 ], to: [ 50, 300 ] ).between( from: 10000, to: 10500 )
c2_2.accompany( a1_1, offset_x: 100 )
b2_1.accompany( a1_1, offset_x: 200 )

c2_1.move( from: [ 100, 250 ], to: [ 100, 350 ] ).between( from: 10000, to: 11000 )

z1.move( from: [ 550, 550 ], to: [ 550, 550 ] ).between( from: 11000, to: 11500 )
