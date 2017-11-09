module Picturizer
  class Transition
    include Transitable::Movable
    include Transitable::Visible

    attr_reader :duration, :starting_time, :shape

    def initialize( shape )
      @parameters = {}
      @shape = shape
    end

    def status( time )
      @parameters.reduce( {} ) do | acc, ( name, formula) |
        if ( starting_time .. ( starting_time + duration ) ).include?( time )
          acc.merge( name => formula.call( time ) )
        else
          acc
        end
      end
    end

    def available?
      return false unless duration
      return false unless starting_time
      return false if @parameters == {}
      true
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

    def simultaneously_with( target )
      target.shape.delete_void_transition
      target = target.shape.last_transition
      @starting_time = target.starting_time
      @duration = target.duration

      self
    end

    # conjunction
    def while
      self
    end
  end
end
