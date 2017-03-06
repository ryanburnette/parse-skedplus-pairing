require "skedplus_pairing/parser/splitters"
require "date"
require "duration"

class SkedplusPairing::Parser::Day
  include SkedplusPairing::Parser::Splitters
  attr_reader :contents

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
