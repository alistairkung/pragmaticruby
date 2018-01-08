require 'ts'
describe TennisScorer do
  let(:ts) { described_class.new }
  it "should start with a score of 0-0" do
    expect(ts.score).to eq "0-0"
  end

  it "should be 15-0 if server wins a point" do
    ts.give_point_to(:server)
    expect(ts.score).to eq "15-0"
  end

  it "should be 0-15 if receiver wins a point" do
    ts.give_point_to(:receiver)
    expect(ts.score).to eq "0-15"
  end

  it "should be 15-15 after both players win a point" do
    ts.give_point_to(:server)
    ts.give_point_to(:receiver)
    expect(ts.score).to eq "15-15"
  end

  it "should be 40-0 if server wins 3 points" do
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    expect(ts.score).to eq "40-0"
  end

  it "should be W-L if server wins 4 points" do
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    expect(ts.score).to eq "W-L"
  end

  it "should be L-W if server wins 4 points" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    expect(ts.score).to eq "L-W"
  end

  it "should be Deuce after each wins three points" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    expect(ts.score).to eq "DEUCE"
  end

  it "should be A-Server after each wins three points and the server gets one more" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    expect(ts.score).to eq "A-Server"
  end

  it "should be A-Receiver after each wins three points and the receiver gets one more" do
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:receiver)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:server)
    ts.give_point_to(:receiver)
    expect(ts.score).to eq "A-Receiver"
  end
end
