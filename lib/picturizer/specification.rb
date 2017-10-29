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
      @shapes.values.max_by{ | item |
        item.end_time
      }.end_time
    end

    def make_figure_method( name )
      define_singleton_method( name ) do | *args, &blk |
        shapes[ name ].new_transition
      end
    end
  end
end
