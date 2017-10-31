require "forwardable"

module Picturizer
  class Shapes
    extend Forwardable
    
    def_delegators( :@shapes, :each, :values, :[]=, :[] )

    def initialize
      @shapes = {}
    end

    def end_time
      @shapes.values.max_by{ | item |
        item.end_time
      }.end_time
    end
  end
end
