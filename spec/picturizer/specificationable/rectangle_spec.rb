require "picturizer/specificationable/rectangle"

RSpec.describe Picturizer::Specificationable::Rectangle do
  class Test
    include Picturizer::Specificationable::Rectangle
    def shapes
      @s ||= { t: true,
               f: false }
    end
    def make_figure_method( a ); end
  end

  describe "#.rectangle" do
    before do
      @target = Test.new
    end

    context "(1) given an overlapping name" do
      it "raises error" do
        expect{ @target.rectangle( :t ) }.to \
          raise_error( "The name has already been used" )
      end
    end

    context "(2) given a invalid copy" do
      it "raises error" do
        expect{ @target.rectangle( :f, copy: :no_copy ) }.to \
          raise_error( "There's no shape whose name is no_copy" )
      end
    end

    context "(3) given a valid name" do
      before do
        @created_obj = Object.new
        allow( @target ).to receive( :new_shape ).
          and_return( @created_obj )
      end

      it "generates a shape" do
        @target.rectangle( :a )
        expect( @target.shapes[ :a ] ).to eq @created_obj
      end

      it "invokes make_figure_method" do
        expect( @target ).to receive( :make_figure_method )
        @target.rectangle( :a )
      end
    end

    context "(4) not given a name" do
      before do
        @created_obj = Object.new
        allow( @target ).to receive( :new_shape ).
          and_return( @created_obj )
      end

      it "generates a shape" do
        @target.rectangle
        expect( @target.shapes.values ).to include( @created_obj )
      end

      it "doesn't invoke make_figure_method" do
        expect( @target ).not_to receive( :make_figure_method )
        @target.rectangle
      end
    end

    context "(5) given a copy" do
      before do
        @created_obj = Object.new
        @target.shapes[ :copy ] = @created_obj
      end
      
      it "duplicates a shape which is indicated by a copy" do
        @target.rectangle( :new, copy: :copy )
        expect( @target.shapes[ :new ] ).to be_kind_of( Object ) 
      end
    end

    context "(6) not given a copy" do
      it "generates a shape"
    end

    context "(7) given a block" do
      before do
        @created_obj = Object.new
        allow( @target ).to receive( :new_shape ).
          and_return( @created_obj )
      end

      it "yeilds block" do
        expect{ | b | @target.rectangle( &b ) }.to \
          yield_with_args( @created_obj )
      end
    end

    context "(8) not given a block" do
      before do
        @created_obj = Object.new
        allow( @target ).to receive( :new_shape ).
          and_return( @created_obj )
      end

      # it "doesn't yield a block" do
      # end
    end

    context "(8) given multiple names" do
      context "<1> but copy" do
      end
      context "<2> and copy"
    end
  end
end
