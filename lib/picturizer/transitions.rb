require "forwardable"

module Picturizer
  class Transitions
    extend Forwardable

    def_delegators( :@transitions, :<<, :last, :empty?, :reduce )

    def initialize
      @transitions = []
    end

    def end_time
      @transitions.reduce( 0 ) do | tmp, transition |
        if transition.duration == Float::INFINITY
          tmp = transition.starting_time if transition.starting_time > tmp
        else
          val = transition.starting_time + transition.duration
          tmp = val if val > tmp
        end
      end
    end

    def status( time )
      @transitions.reduce( {} ) do | acc, transition |
        tmp = transition.status( time )
        acc.merge!( tmp ) if tmp
        acc
      end
    end
  end
end
