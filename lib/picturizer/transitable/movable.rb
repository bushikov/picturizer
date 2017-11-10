module Picturizer
  module Transitable
    module Movable
      def move( from: [ 0, 0 ], to: [ 0, 0 ] )
        @parameters[ :x ] =
          ->( t ){ from[ 0 ] + ( to[ 0 ] - from[ 0 ] ) * ( t - starting_time ) / duration }
        @parameters[ :y ] =
          ->( t ){ from[ 1 ] + ( to[ 1 ] - from[ 1 ] ) * ( t - starting_time ) / duration }

        self
      end

      alias_method :moving, :move

      def accompany( target, offset_x: 0, offset_y: 0 )
        target.shape.delete_void_transition
        target = target.shape.last_transition
        @starting_time = target.starting_time
        @duration = target.duration

        @parameters[ :x ] =
          ->( t ){ target.status( t )[ :x ] + offset_x }
        @parameters[ :y ] =
          ->( t ){ target.status( t )[ :y ] + offset_y }

        self
      end

      alias_method :accompanying, :accompany
    end
  end
end
