require "skedplus"
require "skedplus/durationable"

class Skedplus::Flight
  include Skedplus::Durationable

  def initialize(parser)
    @parser = parser
  end

  %w{number tail org dest dep arr pax credit dpu dhd turn}
  .each do |col|
    define_method(col) do
      @parser.send(col)
    end
  end

  def sequence
    @parser.sequence.to_i
  end

  def block
    self.make_duration(@parser.block)
  end
end
