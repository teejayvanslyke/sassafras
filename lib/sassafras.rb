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

    def initialize(type, base)
      @base_rgb   = Color::RGB.const_get(base.to_s.camelize)
      @type       = type
      @tints      = Tints.new(base)
    end

    def base 
      @base_rgb.html
    end

    def colors 
      {}.merge(@tints.colors)
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

  class Tints

    attr_reader :colors

    def initialize(base)
      @rgb = Color::RGB.const_get(base.to_s.camelize)
      @colors = {
        :base   => @rgb.html,
        :mid    => @rgb.lighten_by(50).html,
        :light  => @rgb.lighten_by(30).html,
        :pale   => @rgb.lighten_by(10).html
      }
    end

    def base;  @colors[:base];  end
    def mid;   @colors[:mid];   end
    def light; @colors[:light]; end
    def pale;  @colors[:pale];  end

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
