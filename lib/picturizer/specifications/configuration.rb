module Picturizer
  module Specifications
    module Configuration
      def configure( &blk )
        return unless block_given?

        config.instance_eval( &blk )
      end
    end
  end
end
