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
    end
  end
end
