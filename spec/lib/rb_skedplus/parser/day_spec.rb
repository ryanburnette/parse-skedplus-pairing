require "rb_skedplus/parser/pairing"
require "rb_skedplus/parser/day"

RSpec.describe RbSkedplus::Parser::Day do
  before :all do
    file_path = "spec/data/7050924_20161225_F404PC.txt"
    pairing = RbSkedplus::Parser::Pairing.new_from_file_path(file_path)
    @day = RbSkedplus::Parser::Day.new(pairing.days[0])
  end

  it "#contents" do
    expect(@day.contents).to include "Sunday 12-25-2016    Report: 08:10    Release: 17:33"
  end

  it "#lines" do
    expect(@day.lines).to be_a Array 
    expect(@day.lines.count).to equal 9
    expect(@day.lines[0]).to include "Sunday 12-25-2016    Report: 08:10    Release: 17:33"
    expect(@day.lines[1]).to include "Flight  Tail    Org  Dest Dep    Arr    Pax Block  Credit D/PU Dhd Turn"
    expect(@day.lines[2]).to include " 1. 2772    901     DFW  CLL  09:00  10:04 "
  end

  it "#headers" do
    expect(@day.headers[0]).to eq @day.lines[0]
    expect(@day.headers[1]).to eq @day.lines[1]
  end

  it "#date_str" do
    expect(@day.date_str).to eq "12-25-2016"
  end

  it "#date" do
    expect(@day.date).to be_a Date
    expect(@day.date.to_s).to eq "2016-12-25"
  end

  it "#columns" do
    expect(@day.columns).to be_a Array
    expect(@day.columns.count).to eq 12
    expect(@day.columns).to include "Flight"
    expect(@day.columns).to include "Tail"
    expect(@day.columns).to include "Org"
    expect(@day.columns).to include "Dest"
    expect(@day.columns).to include "Dep"
    expect(@day.columns).to include "Arr"
    expect(@day.columns).to include "Pax"
    expect(@day.columns).to include "Block"
    expect(@day.columns).to include "Credit"
    expect(@day.columns).to include "D/PU"
    expect(@day.columns).to include "Dhd"
    expect(@day.columns).to include "Turn"
  end

  it "#flights" do
    expect(@day.flights.count).to eq 5
  end

  it "#footers" do
    expect(@day.footers.count).to eq 2
    expect(@day.footers[0]).to include "Day Total: 4:39   5:37   Duty: 9:23"
    expect(@day.footers[1]).to include "Hotel: Four Points College Stati   Layover: 12:30"
  end

  it "#layover_str" do
    expect(@day.layover_str).to eq "12:30"
  end

  it "#layover_duration" do
    expect(@day.layover_duration).to be_a Duration
    expect(@day.layover_duration.strftime("%h:%m")).to eq "12:30"
  end
end
