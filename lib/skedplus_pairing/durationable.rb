require "duration"

module SkedplusPairing::Durationable
  def make_duration(str)
    hours   = str.split(":").first
    minutes = str.split(":").last
    Duration.new(hours: hours, minutes: minutes)
  end
end
