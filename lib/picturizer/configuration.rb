module Picturizer
  class Configuration
    attr_accessor :directory, :file_name, :format, :interval

    def initialize
      @directory = "."
      @file_name = "out"
      @format = "gif"
      @interval = 1
    end
  end
end
