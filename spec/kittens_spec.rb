require 'spec_helper'

describe Kittens do
  it 'has a version number' do
    expect(Kittens::VERSION).not_to be nil
  end

  it 'extricates lost kittens from the clutches of witches' do

    kitten_coords = Directions.fromForensics("xyz@example.com")
    response = SearchParty.fromLocation(kitten_coords).launch()
    expect(response.status).to eq(200)
    expect(response.body).to eq("RETRIEVED")
  end
end
