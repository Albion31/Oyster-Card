require "station"
describe Station do
  let(:subject) {Station.new("Waterloo", :one)}
 
  describe "#name" do
  	it "should return the name" do
  	  expect(subject.name).to eq "Waterloo"
  	end
  end
  describe "#zone" do
  	it "should return the zone" do
  	  expect(subject.zone).to eq :one
  	end
  end
end
