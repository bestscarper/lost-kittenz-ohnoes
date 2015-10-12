require 'spec_helper'
require 'rspec/mocks'

module Kittens

describe Locator do
  it 'find locates the kitten given info from the forensics api' do
    api = instance_double("Kitten::Forensics", 'xyz@example.com')
    directions = %w({forward right forward left forward]})

    expect(api).to receive(:directions).and_return(directions)

    locator = Kittens::Locator.new(api)
    location = locator.fromForensics
    expect(location).to eq %w(1 2)
  end
end

end
