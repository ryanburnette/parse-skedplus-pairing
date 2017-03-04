require "date"
require "chronic"
require "active_support/core_ext/time/zones"

class SkedplusPairing::Flight
  include SkedplusPairing::Durationable
  extend Forwardable
  attr_accessor :date
  def_delegators :@parser, :number, :tail, :dpu

  def initialize(parser, args={})
    @parser = parser
    @date = args[:date] if args.has_key?(:date)
  end

  def sequence
    @parser.sequence.to_i
  end

  def block
    self.duration_from_hours_minutes_str(@parser.block)
  end

  def pax
    @parser.pax.to_i
  end

  def credit
    self.duration_from_hours_minutes_str(@parser.credit)
  end

  def dhd?
    @parser.dhd == "D" ? true : false
  end

  def turn
    self.duration_from_hours_minutes_str(@parser.turn)
  end

  def org
    SkedplusPairing::Airport.new(@parser.org)
  end

  def dest
    SkedplusPairing::Airport.new(@parser.dest)
  end

  def date
    @date ||= Date.today
  end

  def dep
    Time.zone = org.timezone
    Chronic.time_class = Time.zone
    Chronic.parse("#{date} #{@parser.dep}")
  end

  def arr
    Time.zone = dest.timezone
    Chronic.time_class = Time.zone
    Chronic.parse("#{date} #{@parser.arr}")
  end

  def duration
    self.duration_from_seconds(arr - dep)
  end
end
