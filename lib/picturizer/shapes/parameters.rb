module Picturizer
  module Shapes
    module Parameters
      def register_parameters( *parameters )
        parameters.each do | p |
          define_method( p ) do | *args, &blk |
            return instance_variable_get( "@#{ p }".to_sym ) \
              unless status( args[ 0 ] )[ p ]

            instance_variable_set( "@#{ p }".to_sym,
                                   status( args[ 0 ] )[ p ] )
          end

          define_method( "#{ p }=".to_sym ) do | *args, &blk |
            instance_variable_set( "@#{ p }".to_sym,
                                   args[ 0 ] )
          end
        end
      end
    end
  end
end
