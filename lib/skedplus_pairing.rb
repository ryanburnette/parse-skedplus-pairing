module SkedplusPairing
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def self.from_file_path(file_path)
    new(File.open(file_path).read)
  end
end

require "skedplus_pairing/airport"
require "skedplus_pairing/crew"
require "skedplus_pairing/crewmember"
require "skedplus_pairing/day"
require "skedplus_pairing/durationable"
require "skedplus_pairing/flight"
require "skedplus_pairing/flight_attendant"
require "skedplus_pairing/pilot"
require "skedplus_pairing/version"
require "skedplus_pairing/parser"
require "skedplus_pairing/parser/day"
require "skedplus_pairing/parser/flight"
require "skedplus_pairing/parser/pairing"
require "skedplus_pairing/parser/splitters"
