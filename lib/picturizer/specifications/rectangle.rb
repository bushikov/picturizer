module Picturizer
  module Specifications
    module Rectangle
      def rectangle( name=nil, copy: false )
        raise( "the name already has been named" ) if shapes[ name ]

        name_to_use = name || rand( 1_000_000_000 )

        if copy
          shapes[ name_to_use ] = shapes[ copy ].dup
        else
          shapes[ name_to_use ] = Picturizer::Shape::Rectangle.new
        end

        yield shapes[ name_to_use ] if block_given?

        make_figure_method( name ) if name
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
    end
  end
end
