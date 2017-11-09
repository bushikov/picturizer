module Picturizer
  module Shape
    class Base
      extend Parameters

      register_parameters :stroke_color,
                          :stroke_linecap,
                          :stroke_linejoin,
                          :stroke_width,
                          :fill_color,
                          :stroke_opacity,
                          :fill_opacity,
                          :x,
                          :y

      attr_accessor :transitions

      def initialize
        raise( "initialize must be defined if it is empty" )
      end

      def self.method_added( method_name )
        super

        return unless method_name == :initialize

        return if @ignore

        @ignore = true

        ini_method = instance_method( method_name )
        define_method( method_name ) do | *args, &blk |
          pre_initialize
          ini_method.bind( self ).call( *args, &blk )
        end

        @ignore = false
      end
      
      def pre_initialize
        @stroke_color = "black"
        @stroke_linecap = "butt"
        @stroke_linejoin = "miter"
        @stroke_width = 1
        @stroke_opacity = 1
        @fill_color = "white"
        @fill_opacity = 1
        @x = 0
        @y = 0

        @transitions = Picturizer::Transitions.new
        @status = {}
      end

      def end_time
        transitions.end_time
      end

      def current_transition
        transitions << Transition.new( self ) if transitions.empty?
        transitions.last
      end

      def new_transition
        transitions << Transition.new( self )
        transitions.last
      end

      def delete_void_transition
        transitions.pop
      end

      def last_transition
        raise( "There's no transition" ) if transitions.empty?
        transitions.last
      end

      def status( time )
        @status[ time ] ||= transitions.status( time )
      end

      # def last_available_transition
      #   transitions.last_available_transition
      # end

      def initialize_copy( obj )
        current_parameters = parameters( obj.end_time )

        confirmation_classes = [ Fixnum, Bignum, Float,
                                 TrueClass, FalseClass, NilClass ]

        parameter_names.each do | p_name |
          value = current_parameters.send( p_name )

          unless confirmation_classes.include?( value.class )
            send( "#{ p_name }=", value.dup )
          end
        end

        @transitions = Picturizer::Transitions.new
        @status = {}
      end
    end
  end
end
