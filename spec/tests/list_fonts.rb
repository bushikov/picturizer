require "rmagick"

Magick.fonts.each do | f |
  p f.name
end
