$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'rubygems'

gem     'color-tools'
require 'color'

gem     'activesupport'
require 'activesupport'

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

    def sass
      "!base = #{base}"
    end

  end

  class Tints

    attr_reader :base

    def initialize(base)
      @base_rgb   = Color::RGB.const_get(base.to_s.camelize)
    end

    def base
      @base_rgb.html
    end

  end

  
end
