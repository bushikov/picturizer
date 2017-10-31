module Picturizer
  module Transitable
    module SelfReturning
      def method_added( method_name )
        super( method_name )

        main_method = instance_method( method_name )

        define_method( method_name ) do | *args, &blk |
          main_method.bind( self ).call
          self
        end
      end
    end
  end
end
