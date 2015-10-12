require 'kittens'

Given(/^accurate forensic data is available$/) do
  @directions = stub_request(:get, "which-technical-exercise.herokuapp.com/api/cucumber@example.com/directions")
    .to_return( :body => %q({"directions":["forward","right","forward","left","forward]}), :status => 200 )

  @location = stub_request(:get, "which-technical-exercise.herokuapp.com/api/cucumber@example.com/location/1/2")
    .to_return( :body => "RETRIEVED", :status => 200 )
end

When(/^we send a search party to the correct location$/) do
  forensics = Kittens::Forensics.new("cucumber@example.com")

  locator = Kittens::Locator(forensics)
  location = locator.fromForensics

  party = Kittens::SearchParty(forensics)
  party.launch(location)
  # 'launch' is a command - we expect it to succeed
end

Then(/^the kitten is found$/) do
  assert_requested(@location)
  assert_requested(@directions)
end
