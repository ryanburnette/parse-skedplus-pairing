class SkedplusPairing::Flight
  include SkedplusPairing::Durationable
  extend Forwardable
  
  def_delegators :@parser, :number, :tail, :org, :dest, :dep, :arr, :dpu

  def initialize(parser)
    @parser = parser
  end

  def sequence
    @parser.sequence.to_i
  end

  def block
    self.make_duration(@parser.block)
  end

  def pax
    @parser.pax.to_i
  end

  def credit
    self.make_duration(@parser.credit)
  end

  def dhd?
    @parser.dhd == "D" ? true : false
  end

  def turn
    self.make_duration(@parser.turn)
  end
end
