module Picturizer
  class Configuration
    attr_accessor :directory,
                  :file_name,
                  :format,
                  :interval,
                  :ticks_per_second

    def initialize
      @directory = "."
      @file_name = "out"
      @format = :gif
      @interval = 10
      @ticks_per_second = 100
    end
  end
end
