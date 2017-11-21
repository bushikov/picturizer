require "digest/md5"

module Picturizer
  module Specificationable
    module Text
      def text( names=[ nil ], copy: false )
        Array( names ).reduce( nil ) do | std, name |
          raise( "The name has already been used" ) if shapes[ name ]

          name_to_use = ( name || arbitary_name ).to_sym

          if copy
            raise( "There's no shape whose name is #{ copy }" )\
              unless shapes[ copy.to_sym ]
            shapes[ name_to_use ] = shapes[ copy.to_sym ].dup
          else
            shapes[ name_to_use ] = new_shape
          end

          unless std
            yield shapes[ name_to_use ] if block_given?
            std = shapes[ name_to_use ]
          else
            shapes[ name_to_use ] = std.sup
          end

          make_figure_method( name ) if name

          std
        end
      end

      private
        def arbitary_name
          Digest::MD5.hexdigest( arbitary_number.to_s )
        end

        def arbitary_number
          @@number ||= 0
          @@number += 1
        end

        def new_shape
          Picturizer::Shape::Text.new
        end
    end
  end
end
