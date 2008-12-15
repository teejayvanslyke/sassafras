require File.dirname(__FILE__) + '/spec_helper.rb'

describe Sassafras do

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

