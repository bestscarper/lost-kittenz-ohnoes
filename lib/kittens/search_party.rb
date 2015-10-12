require "kittens/version"

module Kittens

  class SearchParty

    def initialize(api)
      @api = api
    end

    def launch(x,y)
      response = @api.location(x,y)
      return response
    end
  end
end
