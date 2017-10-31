module Picturizer
  module Specifications
    module Canvas
      def canvas
        return unless block_given?

        yield canvas_body
      end
    end
  end
end
