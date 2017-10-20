module Picturizer
  module Specifications
    module Rectangle
      def rectangle( name=nil, &blk )
        raise( "rectangle have to be named" ) unless name
        raise( "the name already has been named" ) if shapes[ name ]
        raise( "block has to be defined" ) unless block_given?

        shapes[ name ] = Picturizer::Shapes::Rectangle.new

        shapes[ name ].instance_eval( &blk )

        make_figure_method( name )
      end
    end
  end
end
