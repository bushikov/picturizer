module Picturizer
  class Configuration
    attr_accessor :directory,
                  :file_name,
                  :format,
                  :interval
    attr_reader :ticks_per_second

    def initialize
      @directory = "."
      @file_name = "out"
      @format = :gif
      @interval = 100
      @ticks_per_second = 1000
    end
  end
end
