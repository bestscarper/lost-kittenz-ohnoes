require "kittens/version"
require 'net/http'
require 'json'
require 'uri'

module Kittens

  class Forensics

      def initialize(email)
        @base_uri = "http://which-technical-exercise.herokuapp.com/api/#{email}"
      end

      def directions
        uri = URI(URI.escape("#{@base_uri}/directions"))
        json_body = Net::HTTP.get(uri)
        JSON.parse(json_body)['directions']
      end

      def location(x, y)
        uri = URI(URI.escape("#{@base_uri}/location/#{x}/#{y}"))
        response = Net::HTTP.get(uri)
        response
      end

  end

end
