module Picturizer
  module Transitable
    module Visible
      def fade_out
        formula =
          ->( t ){ ( duration - ( t - starting_time ) ).to_f / duration }
        @parameters[ :stroke_opacity ] = formula
        @parameters[ :fill_opacity ] = formula

        self
      end

      alias_method :fading_out, :fade_out

      def fade_in
        formula = ->( t ){ ( t - starting_time ).to_f / duration }

        @parameters[ :stroke_opacity ] = formula
        @parameters[ :fill_opacity ] = formula

        self
      end

      alias_method :fading_in, :fade_in

      def vanish
        formula = ->( t ){ t >= starting_time ? 0.0 : nil }

        @parameters[ :stroke_opacity ] = formula
        @parameters[ :fill_opacity ] = formula

        self
      end

      alias_method :vanishing, :vanish

      def emerge
        formula = ->( t ){ t >= starting_time ? 1.0 : nil }

        @parameters[ :stroke_opacity ] = formula
        @parameters[ :fill_opacity ] = formula

        self
      end

      alias_method :emerging, :emerge
    end
  end
end
