require 'spec_helper'
require 'rspec/mocks'
require_relative '../lib/kittens/directions'

describe Directions do
  it 'find directions from the forensics api for a given email' do
    api = instance_double("Forensics", :email => 'xyz@example.com')
    locator = Directions
    directions = Directions.new(api).fromForensics("xyz@example.com")
    expect(directions).to eq %w(forward right forward left forward)
  end
end
