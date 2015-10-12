require 'spec_helper'
require 'rspec/mocks'

module Kittens

describe SearchVector do
  it 'moves north by default' do
    vector = SearchVector.new(0,0,0)
    newvector = vector.follow("forward")
    expect(newvector.x).to eq(0)
    expect(newvector.y).to eq(1)
  end

  it 'knows about left turns' do
    newvector = SearchVector.new(0,0,0).follow('left').follow('forward')
    expect(newvector.x).to eq(-1)
    expect(newvector.y).to eq(0)
  end

  it 'knows about right turns' do
    newvector = SearchVector.new(0,0,0).follow('right').follow('forward')
    expect(newvector.x).to eq(1)
    expect(newvector.y).to eq(0)
  end

  it 'can follow many directions' do
    newvector = SearchVector.new(0,0,0)
      .follow('right')
      .follow('right')
      .follow('forward')
      .follow('forward')
    expect(newvector.x).to eq(0)
    expect(newvector.y).to eq(-2)
  end
end

describe Locator do
  it 'find locates the kitten given info from the forensics api' do
    api = instance_double("Kitten::Forensics", 'xyz@example.com')
    directions = %w(forward right forward left forward)

    expect(api).to receive(:directions).and_return(directions)

    locator = Kittens::Locator.new(api)
    location = locator.fromForensics
    expect(location).to eq [1, 2]
  end
end

end
