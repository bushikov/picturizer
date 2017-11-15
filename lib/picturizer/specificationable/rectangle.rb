require "digest/md5"

module Picturizer
  module Specificationable
    module Rectangle
      # def rectangle( name=nil, copy: false )
      #   raise( "The name has already been used" ) \
      #     if name && shapes[ name.to_sym ]
      #
      #   name_to_use = name || rand( 1_000_000_000 ).to_s
      #
      #   name_to_use = name_to_use.to_sym
      #
      #   if copy
      #     raise( "There's no shape whose name is #{ copy }" ) \
      #       unless shapes[ copy ]
      #     shapes[ name_to_use ] = shapes[ copy ].dup
      #   else
      #     # shapes[ name_to_use ] = Picturizer::Shape::Rectangle.new
      #     shapes[ name_to_use ] = new_shape
      #   end
      #
      #   yield shapes[ name_to_use ] if block_given?
      #
      #   make_figure_method( name ) if name
      # end

      def rectangle( names=[ nil ], copy: false )
        Array( names ).reduce( nil ) do | std, name |
          raise( "The name has already been used" ) if shapes[ name ]

          name_to_use = ( name || arbitary_name ).to_sym

          if copy
            raise( "There's no shape whose name is #{ copy }" ) \
              unless shapes[ copy.to_sym ]
            shapes[ name_to_use ] = shapes[ copy.to_sym ].dup
          else
            shapes[ name_to_use ] = new_shape
          end

          unless std
            yield shapes[ name_to_use ] if block_given?
            std = shapes[ name_to_use ]
          else
            shapes[ name_to_use ] = std.dup
          end

          make_figure_method( name ) if name

          std
        end
      end
        
      # def reset( name=nil )
      #   raise( "the name must be given" ) unless name
      #   raise( "the given shape isn't existed" ) unless shapes[ name ]
      #
      #   origins_name = name + rand( 1_000_000_000 ).to_s
      #
      #   shapes[ origins_name ] = shapes[ name ]
      #   shapes[ name ] = shapes[ origins_name ].dup
      #
      #   yield shapes[ name ] if block_given?
      # end

      private
        def arbitary_name
          Digest::MD5.hexdigest( arbitary_number.to_s )
        end

        def arbitary_number
          @@number ||= 0
          @@number += 1
        end

        def new_shape
          Picturizer::Shape::Rectangle.new
        end
    end
  end
end
