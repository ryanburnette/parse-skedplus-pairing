require "skedplus"

class Skedplus::Flight
  def initialize(parser)
    @parser = parser
  end

  %w{number tail org dest dep arr pax block credit dpu dhd turn}
  .each do |col|
    define_method(col) do
      @parser.send(col)
    end
  end

  def sequence
    @parser.sequence.to_i
  end
end
