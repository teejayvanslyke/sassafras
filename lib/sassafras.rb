$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'

gem     'color-tools'
require 'color'

gem     'activesupport'
require 'activesupport'

require 'erb'

module Sassafras

  class Theme

    attr_reader :type
    attr_reader :tints
    attr_reader :base_rgb

    class << self
      def create(type, base)
        Theme.send(type, base)
      end

      def basic(base)
        Theme.new(base)
      end

      def complementary(base)
        ComplementaryTheme.new(base)
      end
    end

    def initialize(base)
      @base_rgb   = Color::RGB.const_get(base.to_s.camelize)
    end

    def base 
      @base_rgb.html
    end

    def base_tints
      Tints.new(@base_rgb, 'base')
    end

    def base_shades
      Shades.new(@base_rgb, 'base')
    end

    def colors 
      {}.merge(base_tints.colors).
         merge(base_shades.colors)
    end

    def color_sets
      {
        'base_tints' => base_tints.colors,
        'base_shades' => base_shades.colors
      }
    end

    def sass
      returning "" do |str|
        colors.each do |name, hex|
          str << "!#{name} = #{hex}\n"
        end
      end
    end

    def get_binding; binding; end

  end

  class ComplementaryTheme < Theme

    def complementary_rgb
      hue = base_rgb.to_hsl.h
      sat = base_rgb.to_hsl.s
      lum = base_rgb.to_hsl.l

      hue += 0.3333333333
      if hue > 1.0
        hue -= 1.0
      end


      Color::HSL.from_fraction(hue, sat, lum).to_rgb
    end

    def complementary; complementary_rgb.html; end

    def complementary_shades
      Shades.new(complementary_rgb, 'comp')
    end

    def complementary_tints
      Tints.new(complementary_rgb, 'comp')
    end

    def colors
      super.merge(complementary_shades.colors).
            merge(complementary_tints.colors)
    end

    def color_sets
      super.merge({
        'complementary_shades' => complementary_shades.colors,
        'complementary_tints'  => complementary_tints.colors
      })
    end

  end

  class ColorSet 

    def initialize(base_rgb, prefix=nil)
      @rgb = base_rgb
      @prefix = prefix
      @colors = {}
    end
    
    def colors
      returning Hash.new do |hash|
        @colors.each do |name, hex|
          if @prefix
            hash["#{@prefix}_#{name}"] = hex
          else
            hash[name] = hex
          end
        end
      end
    end

    def method_missing(method, *args)
      return @colors[method.to_s] if @colors[method.to_s]
      super
    end

  end


  class Tints < ColorSet

    def initialize(base_rgb, prefix=nil)
      super(base_rgb, prefix)
      @colors = {
        'mid'      => @rgb.html,
        'light'    => @rgb.lighten_by(50).html,
        'lighter'  => @rgb.lighten_by(30).html,
        'lightest' => @rgb.lighten_by(10).html
      }
    end

  end

  class Shades < ColorSet
    
    def initialize(base_rgb, prefix=nil)
      super(base_rgb, prefix)
      @colors = {
        'mid'     => @rgb.html,
        'dark'    => @rgb.darken_by(50).html,
        'darker'  => @rgb.darken_by(30).html,
        'darkest' => @rgb.darken_by(10).html
      }
    end

  end

  class HTMLSwatch

    def initialize(theme)
      @theme = theme
    end

    def output
      File.open(File.dirname(__FILE__) + '/sassafras/swatch.html.erb') do |f|
        erb = ERB.new(f.read)
        erb.run(@theme.get_binding)
      end
    end
  end
  
end
