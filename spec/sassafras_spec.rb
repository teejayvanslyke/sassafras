require File.dirname(__FILE__) + '/spec_helper.rb'

describe Sassafras do

  describe Sassafras::Theme do 

    describe "when creating a basic color scheme" do
   
      before :each do
        @sassafras = Sassafras::Theme.new(:basic, :red)
      end

      it "sets the base color" do
        @sassafras.base.should == "#ff0000"
      end

      it "sets the tint colors" do
        @sassafras.tints.base.should == "#ff0000"
      end

    end

    describe "when generating Sass output" do
      
      before :each do
        @sassafras = Sassafras::Theme.new(:basic, :red)
      end
      
      it "outputs the base color" do
        @sassafras.sass.should include("!base = #ff0000")
      end

    end

  end

  describe Sassafras::Tints do

    before :each do 
      @tints = Sassafras::Tints.new(:red)
    end

    describe "accessing tints" do

      it "has a base tint" do
        @tints.base.should == '#ff0000'
      end

      it "has a mid tint" do
        @tints.mid.should == '#ffbfbf'
      end

      it "has a light tint" do
        @tints.light.should == '#ff8080'
      end

      it "has a pale tint" do
        @tints.pale.should == '#ff4040'
      end

    end

    describe "when generating Sass output" do

      it "outputs five levels of tints" do
      end
    end


  end

end

