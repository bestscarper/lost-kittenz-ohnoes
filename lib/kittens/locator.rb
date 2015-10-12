require "kittens/version"

module Kittens

  class SearchVector

    attr_reader :x, :y, :bearing

    def initialize(x,y,bearing)
      @x = x
      @y = y
      @bearing = bearing
    end

    def follow(instruction)
      newx = x
      newy = y
      newbearing = bearing
      if instruction == 'forward'
        newx = x + Math.sin(bearing * Math::PI/2)
        newy = y + Math.cos(bearing * Math::PI/2)
      end
      if instruction == 'left'
        newbearing = bearing - 1
      end
      if instruction == 'right'
        newbearing = bearing + 1
      end
      return SearchVector.new(newx.to_int, newy.to_int, newbearing)
    end
  end

  class Locator

    def initialize(api)
      @api = api
    end

    def fromForensics
      directions = @api.directions
      # values.map(&:length).inject(0) {|x,y| x + y}
      return %w(1 2)
    end
  end
end
