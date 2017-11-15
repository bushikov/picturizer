module Picturizer
  module Specificationable
    module Configuration
      def configure
        return unless block_given?

        yield config
      end
    end
  end
end
