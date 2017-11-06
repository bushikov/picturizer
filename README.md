# Picturizer

## Description
This app enables you to generate image files easily with DSL via ImageMagick.

## Requirements
ImageMagick has to be installed.

```
sudo apt-get install libmagickwand-dev
```

## Installation

```
git clone https://github.com/bushikov/picturizer.git
```

## Usage
```
bundle exec exe/pic [FILE]
```

## DSL grammar

### Still image

```ruby
configure do | c |           # configuration about the file
  c.directory = "."          # the place which the image will be stored
  c.file_name = "rectangle"  # the image file name
  c.format = :png            # image format
end

canvas do | c |              # configuration about the resolution and so on
  c.width = 700              # image's width
  c.height = 700             # image's height
end

rectangle do | r |           # make a rectangle
  r.width = 400              # the rectangle's width
  r.height = 400             # the rectangle's height
  r.x = 100                  # the horizontal position of the upper left corner of the rectangle
  r.y = 100                  # the vertical position of the upper left corner of the rectangle
  r.fill_color = "red"       # the color which will fill the inner of rectangle
  r.stroke_color = "black"   # the color which will outline the rectangle
end
```

### Animated image

```ruby
configure do | c |
  c.directory = "."
  c.file_name = "anime"
  c.format = :gif
  c.interval = 100
  c.ticks_per_second = 1000
end

canvas do | c |
  c.width = 700
  c.height = 700
end

rectangle( "rec1" ) do | r |
  r.width = 100
  r.height = 100
  r.fill_color = "blue"
  r.stroke_color = "black"
end

rec1.move( from: [ 0, 0 ], to: [ 400, 400 ] ).between( from: 0, to: 2000 )
```
### details
coming soon

## Examples

The examples are [here](./examples/EXAMPLES.md)
