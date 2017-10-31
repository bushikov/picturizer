module Picturizer
  class Specification
    include Specifications::Configuration
    include Specifications::Canvas
    include Specifications::Rectangle

    attr_reader :specification, :shapes, :canvas_body, :config

    def initialize( spec )
      @specification = spec
      # @shapes = {}
      @shapes = Picturizer::Shapes.new
      @canvas_body = Shape::Canvas.new
      @config = Configuration.new

      instance_eval( spec )
    end

    def end_time
      @shapes.end_time
    end

    def make_figure_method( name )
      define_singleton_method( name ) do | *args, &blk |
        shapes[ name ].new_transition
      end
    end
  end
end
