module Picturizer
  module Command
    def self.run( argv )
      spec = Picturizer::Specification.new( File.open( argv[ 0 ], "r" ).read )

      container = Picturizer::Painter.draw( spec )

      container.write( spec.config.directory + "/" + spec.config.file_name + "." + spec.config.format.to_s )
    end
  end
end
