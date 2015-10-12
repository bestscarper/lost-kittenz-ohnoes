require 'spec_helper'
require 'webmock'
require 'webmock/rspec'
include WebMock::API
# require_relative '../lib/kittens/forensics'

module Kittens

    describe Forensics do
        it 'can call the directions api and return the list of directions' do
            api = Forensics.new('xyz@example.com')

            stub_request(:get, "which-technical-exercise.herokuapp.com/api/xyz@example.com/directions").
                to_return( :body => %q({"directions":["forward"]}), :status => 200 )

            forensics = api.directions

            expect(forensics).to eq %w(forward)
        end

        it 'can call the location api for a successful response' do
            api = Forensics.new('xyz@example.com')

            stub_request(:get, "which-technical-exercise.herokuapp.com/api/xyz@example.com/location/55/66").
                to_return( :body => "RETRIEVED", :status => 200 )

            response = api.location(55,66)

            expect(response).to eq 'RETRIEVED'
        end
    end

end
