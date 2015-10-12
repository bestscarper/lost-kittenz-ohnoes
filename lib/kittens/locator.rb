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
      here = SearchVector.new(0,0,0)
      directions.each do |instruction|
        here = here.follow(instruction)
      end
      return [here.x, here.y]
    end
  end
end
