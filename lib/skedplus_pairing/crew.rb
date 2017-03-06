module SkedplusPairing::Crew
  attr_reader :members

  def initialize(members)
    @members = []
    members.each { |m| add_member(m) }
  end

  def add_member(crewmember)
    @members << crewmember
  end

  def add_members(crewmembers)
    crewmembers.each { |m| add_member(m) }
  end
end
