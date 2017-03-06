require "date"
require "chronic"
require "active_support/core_ext/time/zones"

module SkedplusPairing::Timeable
  def time_from_timezone_date_time(timezone, date, time)
    Time.zone = timezone
    Chronic.time_class = Time.zone
    Chronic.parse("#{date} #{time}")
  end
end
