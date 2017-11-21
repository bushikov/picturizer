require "digest/md5"

module Picturizer
  module Specificationable
    module Equipment
      def add_shape_method( method_name, new_shape_method )
        define_method( method_name ) do
          | names=[nil], copy: false, &blk |
          Array( names ).reduce( nil ) do | std, name |
            raise( "The name has already been used" ) if shapes[ name ]

            name_to_use = ( name || arbitary_name ).to_sym

            if copy
              raise( "There's no shape whose name is #{ copy }" ) unless shapes[ copy.to_sym ]
              shapes[ name_to_use ] = shapes[ copy.to_sym ].dup
            else
              # shapes[ name_to_use ] = new_shape
              shapes[ name_to_use ] = send( new_shape_method )
            end

            unless std
              blk.call( shapes[ name_to_use ] ) if blk
              std = shapes[ name_to_use ]
            else
              shapes[ name_to_use ] = std.dup
            end

            make_figure_method( name.to_sym ) if name

            std
          end
        end
      end

      def self.extended( klass )
        klass.include InstanceMethods
      end

      module InstanceMethods
        private
          # def new_shape
          #   raise( "Necessary shape must be returnd here" )
          # end

          def arbitary_name
            Digest::MD5.hexdigest( arbitary_number.to_s )
          end

          def arbitary_number
            @@number ||= 0
            @@number += 1
          end
      end
    end
  end
end
