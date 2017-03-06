RSpec.describe SkedplusPairing::Day do
  FakeDayParser = Struct.new(:date, :layover, :hotel)
  let(:fake_day_parser) { FakeDayParser.new("12-25-2016", "01:02", "Marriott") }
  let(:day) { SkedplusPairing::Day.new(fake_day_parser) }

  it "#date" do
    expect(day.date).to be_a Date
    expect(day.date.to_s).to eq "2016-12-25"
  end

  it "#layover" do
    expect(day.layover).to be_a Duration
    expect(day.layover.hours).to eq 1
    expect(day.layover.minutes).to eq 2
  end

  it "#flights" do
    expect(day.flights).to be_a Array
    day.flights.each { |f| expect(f).to be_a SkedplusPairing::Flight }
  end

  it "#report" do
    expect(day.report).to be_a Time
  end

  it "#release" do
    expect(day.release).to be_a Time
  end

  it "#hotel?" do
    expect(day.hotel?).to be_truthy
  end

  it "#hotel" do
    expect(day.hotel).to be_a String
  end
end
