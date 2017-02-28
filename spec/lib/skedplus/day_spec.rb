require "skedplus/day"

RSpec.describe Skedplus::Day do
  before :all do
    @day
  end

  it "#date" do
    expect(@day.date).to be_a Date
    expect(@day.date.to_s).to eq "2016-12-25"
  end

  it "#layover" do
    expect(@day.layover_duration).to be_a Duration
    expect(@day.layover_duration.strftime("%h:%m")).to eq "12:30"
  end
end
