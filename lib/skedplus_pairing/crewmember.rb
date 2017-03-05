class SkedplusPairing::Crewmember
  extend Forwardable
  def_delegators :@parser, :name, :equipment

  def initialize(parser)
    @parser = parser
  end

  def first_name
    name.split(" ").first
  end

  def last_name
    name.split(" ").last
  end

  def base
    @base ||= SkedplusPairing::Airport.new(@parser.base)
  end
end