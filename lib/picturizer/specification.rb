module Picturizer
  class Specification
    include Specifications::Configuration
    include Specifications::Canvas
    include Specifications::Rectangle

    attr_reader :specification, :shapes, :canvas, :config

    def initialize( spec )
      @specification = spec
      @shapes = {}
      @canvas = Shapes::Canvas.new
      @config = Configuration.new

      instance_eval( spec )
    end

    def end_time
      0
    end

    def make_figure_method( name )
      define_singleton_method( name ) do | *args, &blk |
        
      end
    end
  end
end
