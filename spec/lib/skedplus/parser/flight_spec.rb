require "skedplus/parser/pairing"
require "skedplus/parser/day"
require "skedplus/parser/flight"

RSpec.describe Skedplus::Parser::Flight do
  before :all do
    file_path = "spec/data/7050924_20161225_F404PC.txt"
    file_contents = File.open(file_path).read
    pairing = Skedplus::Parser::Pairing.new(file_contents)

    days = pairing.days.collect { |d| Skedplus::Parser::Day.new(d) }

    @flight   = Skedplus::Parser::Flight.parse(days[0].flights[0])
    @flight5  = Skedplus::Parser::Flight.parse(days[0].flights[4])
    @flight11 = Skedplus::Parser::Flight.parse(days[2].flights[1])
  end

    
  let(:flight20) {Skedplus::Parser::Flight.parse(days[2].flights[1]) }

  file_paths.each do |pathkk

  it "parses and returns a struct" do
    expect(@flight).to be_a Struct
  end

  it "#sequence" do
    expect(@flight.sequence).to eq "1"
    expect(@flight11.sequence).to eq "11"
  end

  it "#flight" do
    expect(@flight.number).to eq "2772"
  end

  it "#tail" do
    expect(@flight.tail).to eq "901"
  end

  it "#org" do
    expect(@flight.org).to eq "DFW"
  end

  it "#dest" do
    expect(@flight.dest).to eq "CLL"
  end

  it "#dep" do
    expect(@flight.dep).to eq "09:00"
  end

  it "#arr" do
    expect(@flight.arr).to eq "10:04"
  end

  it "#pax" do
    expect(@flight.pax).to eq "0"
  end

  it "#block" do
    expect(@flight.block).to eq "1:04"
  end

  it "#credit" do
    expect(@flight.credit).to eq "1:04"
  end

  it "#dpu" do
    expect(@flight.dpu).to eq ""
  end

  it "#dhd" do
    expect(@flight.dhd).to eq ""
    expect(@flight5.dhd).to eq "D"
  end

  it "#turn" do
    expect(@flight.turn).to eq "0:23"
  end
end
