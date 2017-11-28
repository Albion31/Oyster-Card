require "journey"

describe Journey do 
	let(:station) {double(:station)}
  describe "#start" do
  	it "should set the entry station" do
  	  expect {subject.start(station)}.to change{subject.entry_station}.to eq station
  	end
  end
  describe "#end" do
  	it "should set the exit station" do
  	  expect {subject.end(station)}.to change{subject.exit_station}.to eq station
  	end
  end
  describe "#complete?" do
  	it "should return true once a journey is complete" do
  	  subject.start(station)
  	  subject.end(station)
  	  expect(subject.complete?).to eq true
  	end
  end
end
