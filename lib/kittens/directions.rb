require "kittens/version"
require 'net/http'
require 'json'

module Directions

  def self.fromForensics(email)
    uri = URI("http://which-technical-exercise.herokuapp.com/api/#{email}/directions")
    json_body = Net::HTTP.get(uri)
    JSON.parse(json_body)['directions']
  end

end
