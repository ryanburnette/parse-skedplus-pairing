RSpec.describe SkedplusPairing::Day do
  FakeDayParser = Struct.new(:date, :layover)
  let(:fake_day_parser) { FakeDayParser.new("12-25-2016", "01:02") }
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
end
