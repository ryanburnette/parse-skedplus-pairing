require "date"

class SkedplusPairing::Day
  include SkedplusPairing::Durationable
  #extend Forwardable
  #def_delegators :@parser, :date

  def initialize(parser)
    @parser = parser
  end

  def date
    Date.strptime(@parser.date, "%m-%d-%Y")
  end

  def layover
    self.duration_from_hours_minutes_str(@parser.layover)
  end
end
