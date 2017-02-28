require "skedplus/parser/splitters"
require "date"
require "duration"

class Skedplus::Parser::Day
  attr_reader :contents

  include Skedplus::Parser::Splitters

  def initialize(contents)
    @contents = contents
  end

  def lines
    @contents.split(RETURN).reject { |x| x.empty? }
  end

  def headers
    lines[0..1]
  end

  def date
    headers.first.split(SPACE)[1]
  end

  def columns
    headers[1].split(SPACE).reject { |x| x.empty? }
  end

  def flights
    lines.select { |l| l[2] == "." }
  end

  def footers
    lines
    .reject { |l| headers.include?(l) }
    .reject { |l| flights.include?(l) }
  end

  def layover
    footers.last.split(SPACE).last
  end

  # need to move this to Data obj, not job of parser to make child obejcts like this
  def layover_duration
    parts = layover_str.split(":")
    hours = parts[0]
    minutes = parts[1]
    Duration.new(hours: hours, minutes: minutes)
  end

  def report
    headers[0].split(SPACE)[3]
  end

  def release
    headers[0].split(SPACE)[5]
  end

  def total_block
    footers[0].split(SPACE)[2]
  end

  def total_credit
    footers[0].split(SPACE)[3]
  end

  def total_duty
    footers[0].split(SPACE)[5]
  end

  def hotel
    footers[1].to_s[7...34].strip
  end
end
