require File.dirname(__FILE__) + '/spec_helper.rb'

describe Sassafras do

  describe Sassafras::Theme do 

    describe "when creating a basic color scheme" do
   
      before :each do
        @sassafras = Sassafras::Theme.basic(:red)
      end

      it "sets the base color" do
        @sassafras.base.should == "#ff0000"
      end

      it "generates the base tints" do
        @sassafras.base_tints.should be_instance_of(Sassafras::Tints)
      end

      it "generates the base shades" do
        @sassafras.base_shades.should be_instance_of(Sassafras::Shades)
      end

    end

    describe "when creating a complementary color scheme" do

      before :each do 
        @sassafras = Sassafras::Theme.complementary(:red)
      end

      it "sets the base color" do
        @sassafras.base.should == "#ff0000"
      end

      it "sets the complementary color" do
        @sassafras.complementary.should == "#00ff00"
      end

      it "generates the complementary tints" do
        @sassafras.complementary_tints.should_not be_nil
        @sassafras.complementary_tints.should be_instance_of(Sassafras::Tints)
      end

      it "generates the complementary shades" do
        @sassafras.complementary_shades.should_not be_nil
        @sassafras.complementary_shades.should be_instance_of(Sassafras::Shades)
      end

    end

    describe "when generating Sass output" do
      
      before :each do
        @sassafras = Sassafras::Theme.basic(:red)
      end
      
      it "outputs the base color" do
        @sassafras.sass.should include("!base_mid = #ff0000")
      end

    end

  end

  describe Sassafras::Tints do

    before :each do 
      @tints = Sassafras::Tints.new(Color::RGB::Red)
    end

    describe "accessing tints" do

      it "has a base tint" do
        @tints.mid.should == '#ff0000'
      end

      it "has a light tint" do
        @tints.light.should == '#ff8080'
      end

      it "has a lighter tint" do
        @tints.lighter.should == '#ffb3b3'
      end

      it "has a lightest tint" do
        @tints.lightest.should == '#ffe6e6'
      end

    end

    describe "when generating Sass output" do

      it "outputs five levels of tints" do
      end
    end

    describe "when generating colors with a prefixed name" do
      before :each do 
        @tints = Sassafras::Tints.new(Color::RGB::Red, 'foo')
      end

      it "prefixes all of the colors with the specified prefix" do
        @tints.colors.should have_key('foo_mid')
        @tints.colors.should have_key('foo_light')
        @tints.colors.should have_key('foo_lighter')
        @tints.colors.should have_key('foo_lightest')
      end
    end

  end

  describe Sassafras::Shades do

    before :each do 
      @shades = Sassafras::Shades.new(Color::RGB::Red)
    end

    describe "accessing shades" do

      it "has a base shade" do
        @shades.mid.should == '#ff0000'
      end

      it "has a dark shade" do
        @shades.dark.should == '#800000'
      end

      it "has a darker shade" do
        @shades.darker.should == '#4d0000'
      end

      it "has a darkest shade" do
        @shades.darkest.should == '#1a0000'
      end
    end

    describe "when generating colors with a prefixed name" do
      before :each do 
        @shades = Sassafras::Shades.new(Color::RGB::Red, 'foo')
      end

      it "prefixes all of the colors with the specified prefix" do
        @shades.colors.should have_key('foo_mid')
        @shades.colors.should have_key('foo_dark')
        @shades.colors.should have_key('foo_darker')
        @shades.colors.should have_key('foo_darkest')
      end
    end
  end

end

