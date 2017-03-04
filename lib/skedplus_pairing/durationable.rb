require "duration"

module SkedplusPairing::Durationable
  def duration_from_hours_minutes_str(str)
    hours   = str.split(":").first
    minutes = str.split(":").last
    Duration.new(hours: hours, minutes: minutes)
  end

  def duration_from_seconds(seconds)
    Duration.new(seconds: seconds)
  end
end
