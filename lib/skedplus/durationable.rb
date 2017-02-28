require "duration"

module Skedplus::Durationable
  def self.make_duration(str)
    hours   = str.split(":").first
    minutes = str.split(":").last
    Duration.new(hours: hours, minutes: minutes)
  end
end
