require "spec_helper"
require "picturizer/shapes/parameters"

RSpec.describe Picturizer::Shapes::Parameters do
  class Klass
    extend Picturizer::Shapes::Parameters
    register_parameters :val1, :val2, :val3
    def initialize
    end
    def status( t )
      { val1: @val1, val2: @val2, val3: @val3 }
    end
  end

  describe "reader & writer" do
    it "works" do
      obj = Klass.new
      obj.val1 = 1
      obj.val2 = 2
      expect( obj.val1 ).to eq 1
      expect( obj.val2 ).to eq 2
      expect( obj.val3 ).to eq nil
    end
  end

  describe "parameters" do
    it "returns parameters as Struct object" do
      obj = Klass.new
      obj.val1 = 1
      obj.val2 = 2
      parameters = obj.parameters
      expect( parameters.val1 ).to eq 1
      expect( parameters.val2 ).to eq 2
      expect( parameters.val3 ).to eq nil
    end
  end
end
