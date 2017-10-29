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
      @format = "gif"
      @interval = 1
      @ticks_per_second = 1000
    end
  end
end
