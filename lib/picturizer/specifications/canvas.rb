module Picturizer
  module Specifications
    module Canvas
      def canvas( &blk )
        return unless block_given?

        canvas.instance_eval( &blk )
      end
    end
  end
end
