require "skedplus"
require "skedplus/durationable"

class Skedplus::Flight
  include Skedplus::Durationable
  extend Forwardable
  
  def_delegators :@parser, :number, :tail, :org, :dest, :dep, :arr, :pax, :credit, :dpu, :dhd, :turn

  def initialize(parser)
    @parser = parser
  end

  def sequence
    @parser.sequence.to_i
  end

  def block
    self.make_duration(@parser.block)
  end
end
