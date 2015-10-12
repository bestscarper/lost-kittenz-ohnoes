require 'spec_helper'
require 'rspec/mocks'

module Kittens

  describe SearchParty do
    it 'it calls out the search part using the forensics api' do
      api = instance_double("Kitten::Forensics", 'xyz@example.com')

      expect(api).to receive(:location).with(55,66)

      search_party = Kittens::SearchParty.new(api)
      search_party.launch(55,66)
    end
  end

end
