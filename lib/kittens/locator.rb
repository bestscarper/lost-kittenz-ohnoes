require "kittens/version"

module Kittens
  class Locator

    def initialize(api)
      @api = api
    end

    def fromForensics
      directions = @api.directions
      return %w(1 2)
    end
  end
end
