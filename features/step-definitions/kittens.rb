Given(/^accurate forensic data is available$/) do
  @directions = stub_request(:get, "which-technical-exercise.herokuapp.com/api/xyz@example.com/directions")
    .to_return( :body => %q({"directions":["forward","right","forward","left","forward]}), :status => 200 )
end

When(/^we send a search party to the correct location$/) do
  @location = stub_request(:get, "which-technical-exercise.herokuapp.com/api/xyz@example.com/location/1/2")
    .to_return( :body => "RETRIEVED", :status => 200 )
end

Then(/^the kitten is found$/) do
  assert_requested(@location)
  assert_requested(@directions)
end
