require "date"

class SkedplusPairing::Day
  def initialize(parser)
    @parser = parser
  end

  def date
    Date.strptime(@parser.date, "%m-%d-%Y")
  end
end
