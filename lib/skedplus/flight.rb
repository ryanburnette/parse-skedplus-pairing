require "skedplus/data"

class Skedplus::Data::Flight
  def initialize(parser)
    @parser = parser
  end

  %w{sequence number tail org dest dep arr pax block credit dpu dhd turn}
  .each do |col|
    define_method(col) do
      @parser.send(col)
    end
  end
end
