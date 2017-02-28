require "rb_skedplus/parser/splitters"
require "date"
require "duration"

module RbSkedplus
  module Parser

    class Day
      attr_reader :contents

      include Splitters

      def initialize(contents)
        @contents = contents
      end

      def lines
        @contents.split(RETURN).reject { |x| x.empty? }
      end

      def headers
        [lines[0], lines[1]]
      end

      def date_str
        headers[0].split(SPACE)[1]
      end

      def date
        Date.strptime(date_str, "%m-%d-%Y")
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

      # rename to layover as its implied everythings a str coming from the parser
      def layover_str
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

  end
end
