require "skedplus/flight"

RSpec.describe Skedplus::Flight do
  before :all do 
    FakeParser = Struct.new(:sequence, :number, :tail, :org, :dest, :dep, :arr, :pax, :block, :credit, :dpu, :dhd, :turn)
    fake_parser = FakeParser.new("1", "5001", "901", "ATL", "CHS", "12:34", "13:34", "32", "01:00", "01:12", "", "", "00:30")
    @flight = Skedplus::Flight.new(fake_parser)
  end

  it "#sequence" do
    expect(@flight.sequence).to be_a Integer
    expect(@flight.sequence).to eq 1
  end

  it "#number" do
    expect(@flight.number).to eq "5001"
  end

  it "#tail" do
    expect(@flight.tail).to eq "901"
  end

  it "#org" do
  end

  it "#dest" do
  end

  it "#dep" do
  end

  it "#arr" do
  end

  it "#pax" do
    expect(@flight.pax).to be_a Integer
    expect(@flight.pax).to eq 32
  end

  it "#block" do
    expect(@flight.block).to be_a Duration
    expect(@flight.block.hours).to eq 1
    expect(@flight.block.minutes).to eq 0
    # expect(@flight.block.to_s).to eq ""
  end

  it "#credit" do
    expect(@flight.credit).to be_a Duration
    expect(@flight.credit.hours).to eq 1
    expect(@flight.credit.minutes).to eq 12
    # expect(@flight.credit.to_s).to eq ""
  end

  it "#dpu" do
  end

  it "#dhd?" do
    expect(@flight.dhd?).to be_falsy
  end

  it "#turn" do
    expect(@flight.turn).to be_a Duration
    expect(@flight.turn.hours).to eq 0
    expect(@flight.turn.minutes).to eq 30
    # expect(@flight.turn.to_s).to eq ""
  end
end
