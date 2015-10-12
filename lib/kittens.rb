require "kittens/version"
require_relative "kittens/locator"
require_relative "kittens/search_party"
require_relative "kittens/forensics"

module Kittens

  def self.hayelp(email)
    forensics = Kittens::Forensics.new("cucumber@example.com")
    locator = Kittens::Locator.new(forensics)
    puts "Locating kitten..."
    location = locator.fromForensics
    puts "Found little at coords #{location[0]}, #{location[1]}"
    party = Kittens::SearchParty.new(forensics)
    response = party.launch(location[0],location[1])
    puts "Response from search party: #{response}"
  end

end
