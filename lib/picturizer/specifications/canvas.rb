module Picturizer
  module Specifications
    module Canvas
      def canvas
        return unless block_given?

        yield canvas
      end
    end
  end
end
