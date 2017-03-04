class SkedplusPairing::Crewmember
  attr_accessor :name, :base, :equipment

  def initialize(name, base, equipment)
    @name      = name
    @base      = base
    @equipment = equipment
  end

  def self.from_parser(parser)
    new(parser.name, parser.base, parser.equipment)
  end
end
