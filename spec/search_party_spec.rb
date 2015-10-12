require 'spec_helper'
require_relative '../lib/kittens/search_party'

describe SearchParty do
  it 'can generate a search for given coords' do
    api = Forensics.new
    party = SearchParty.fromLocation([3 4])
    expect(party.x).to eq 3
    expect(party.y).to eq 4
  end
end
