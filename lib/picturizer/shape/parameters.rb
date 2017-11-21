module Picturizer
  module Shape
    module Parameters
      def register_common_parameters( *parameters )
        @@common_parameter_names ||= []

        parameters.each do | p |
          @@common_parameter_names << p

          define_method( p ) do | *args, &blk |
            return instance_variable_get( "@#{ p }" ) \
              unless status( args[ 0 ] )[ p ]

            instance_variable_set( "@#{ p }",
                                   status( args[ 0 ] )[ p ] )
          end

          define_method( "#{ p }=".to_sym ) do | *args, &blk |
            instance_variable_set( "@#{ p }".to_sym,
                                   args[ 0 ] )
          end
        end
      end

      def register_parameters( *parameters )
        @parameter_names ||= []

        parameters.each do | p |
          @parameter_names << p

          define_method( p ) do | *args, &blk |
            return instance_variable_get( "@#{ p }" ) \
              unless status( args[ 0 ] )[ p ]

            instance_variable_set( "@#{ p }",
                                   status( args[ 0 ] )[ p ] )
          end

          define_method( "#{ p }=".to_sym ) do | *args, &blk |
            instance_variable_set( "@#{ p }".to_sym,
                                   args[ 0 ] )
          end
        end
      end

      def parameter_names
        @parameter_names
      end

      def common_parameter_names
        @@common_parameter_names
      end

      def self.extended( klass )
        klass.include InstanceMethods
      end

      module InstanceMethods
        def parameters( time )
          paras = Struct.new( *all_parameter_names ).new

          all_parameter_names.each do | p |
            paras.send( "#{ p.to_s }=", send( p, time ) )
          end

          paras
        end

        def all_parameter_names
          self.class.common_parameter_names + parameter_names
        end

        def parameter_names
          self.class.parameter_names
        end
      end
    end
  end
end
