require "picturizer/transitable/movable"
require "picturizer/transitable/visible"

module Picturizer
  class Transition
    include Transitable::Movable
    include Transitable::Visible

    attr_reader :duration, :starting_time

    def initialize( shape )
      @parameters = {}
      @shape = shape
    end

    def status( time )
      @parameters.reduce( Hash.new{ nil } ) do
        | acc, ( name, formula) |
        if ( starting_time .. ( starting_time + duration ) ).include?( time )
          acc.merge( name => formula.call( time ) )
        else
          acc
        end
      end
    end

    def for( d )
      @duration = d
      self
    end

    def between( from: 0, to: 0 )
      @starting_time = from
      @duration = to - from
      self
    end

    def starting( t )
      @starting_time = t
      self
    end

    def at( t )
      @starting_time = t
      @duration = Float::INFINITY
      self
    end

    # moving
    # def move( from: [ 0, 0 ], to: [ 0, 0 ] )
    #   @parameters[ :x ] =
    #     ->( t ){ from[ 0 ] + ( to[ 0 ] - from[ 0 ] ) * t / duration }
    #   @parameters[ :y ] =
    #     ->( t ){ from[ 1 ] + ( to[ 1 ] - from[ 1 ] ) * t / duration }
    #   self
    # end

    # transforming
    # def fade_out
    #   formula = 
    #     ->( t ){ ( duration - ( t - starting_time ) ).to_f / duration }
    #   @parameters[ :stroke_opacity ] = formula
    #   @parameters[ :fill_opacity ] = formula
    #
    #   self
    # end
    #
    # def fade_in
    #   @shape.stroke_opacity = 0
    #   @shape.fill_opacity = 0
    #
    #   formula = ->( t ){ ( t - starting_time ).to_f / duration }
    #
    #   @parameters[ :stroke_opacity ] = formula
    #   @parameters[ :fill_opacity ] = formula
    #
    #   self
    # end
    #
    # def vanish
    #   formula = ->( t ){ t >= starting_time ? 0.0 : nil }
    #
    #   @parameters[ :stroke_opacity ] = formula
    #   @parameters[ :fill_opacity ] = formula
    #
    #   self
    # end
    #
    # def emerge
    #   @shape.stroke_opacity = 0
    #   @shape.fill_opacity = 0
    #
    #   formula = ->( t ){ t >= starting_time ? 1.0 : nil }
    #
    #   @parameters[ :stroke_opacity ] = formula
    #   @parameters[ :fill_opacity ] = formula
    #
    #   self
    # end

    # conjunction
    def while
      self
    end
  end
end
