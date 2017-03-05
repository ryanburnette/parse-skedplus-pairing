RSpec.describe SkedplusPairing::Flight do
  FakeFlightParser = Struct.new(:sequence, :number, :tail, :org, :dest, :dep, :arr, :pax, :block, :credit, :dpu, :dhd, :turn)
  let(:fake_parser) { FakeFlightParser.new("1", "5001", "901", "ATL", "CHS", "12:34", "13:34", "32", "01:00", "01:12", "", "", "00:30") }
  let(:flight) { SkedplusPairing::Flight.new(fake_parser) }

  let(:fake_parser2) { FakeFlightParser.new("1", "5001", "901", "ATL", "DFW", "12:34", "13:34", "32", "01:00", "01:12", "", "", "00:30") }
  let(:flight2) { SkedplusPairing::Flight.new(fake_parser2, { :date => "12-25-2016" }) }

  it "#sequence" do
    expect(flight.sequence).to be_a Integer
    expect(flight.sequence).to eq 1
  end

  it "#date" do
    expect(flight.date).to eq Date.today
  end

  it "#number" do
    expect(flight.number).to eq "5001"
  end

  it "#tail" do
    expect(flight.tail).to eq "901"
  end

  it "#org" do
    expect(flight.org).to be_a SkedplusPairing::Airport
    expect(flight.org.ident).to eq "ATL"
    expect(flight.org.timezone).to eq "America/New_York"
  end

  it "#dest" do
    expect(flight.dest).to be_a SkedplusPairing::Airport
    expect(flight.dest.ident).to eq "CHS"
    expect(flight.dest.name).to eq "Charleston Afb Intl"
  end

  it "#dep" do
    expect(flight.dep).to be_a Time
    expect(flight.dep.zone).to eq "EST"
    expect(flight2.dep.zone).to eq "EST"
    expect(flight2.dep.year).to eq 2016
  end

  it "#arr" do
    expect(flight.arr).to be_a Time
    expect(flight.arr.zone).to eq "EST"
    expect(flight2.arr.zone).to eq "CST"
    expect(flight2.arr.year).to eq 2016
  end

  it "#pax" do
    expect(flight.pax).to be_a Integer
    expect(flight.pax).to eq 32
  end

  it "#block" do
    expect(flight.block).to be_a Duration
    expect(flight.block.hours).to eq 1
    expect(flight.block.minutes).to eq 0
    # expect(flight.block.to_s).to eq ""
  end

  it "#credit" do
    expect(flight.credit).to be_a Duration
    expect(flight.credit.hours).to eq 1
    expect(flight.credit.minutes).to eq 12
    # expect(flight.credit.to_s).to eq ""
  end

  it "#dhd?" do
    expect(flight.dhd?).to be_falsy
  end

  it "#turn" do
    expect(flight.turn).to be_a Duration
    expect(flight.turn.hours).to eq 0
    expect(flight.turn.minutes).to eq 30
  end

  it "#duration" do
    expect(flight.duration.hours).to eq 1
    expect(flight.duration.minutes).to eq 0
    expect(flight2.duration.hours).to eq 2
    expect(flight2.duration.minutes).to eq 0
  end

  # TODO figure out what D/PU is ;)
  it "#dpu"

  # TODO test for daylight savings time by setting up two flights on either
  # side of the change and checking for the proper utc offset
  it "takes into account daylight savings time"

  # TODO test for this by creating a flight that begins in one day and ends in
  # the next day
  it "allows flights to begin on one day and end in the next day"
end
