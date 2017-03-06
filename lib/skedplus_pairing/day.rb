class SkedplusPairing::Day
  include SkedplusPairing::Durationable
  include SkedplusPairing::Timeable
  extend Forwardable
  def_delegators :@parser, :hotel

  def initialize(parser)
    @parser = parser
  end

  def date
    Date.strptime(@parser.date, "%m-%d-%Y")
  end

  def layover
    self.duration_from_hours_minutes_str(@parser.layover)
  end

  def report
    timezone = flights.first.org.timezone
    report = @parser.report
    self.time_from_timezone_date_time(timezone, date, report)
  end

  def release
    timezone = flights.last.dest.timezone
    release = @parser.release
    self.time_from_timezone_date_time(timezone, date, release)
  end

  def flights
    []
  end

  def hotel?
    !!(hotel)
  end
end
