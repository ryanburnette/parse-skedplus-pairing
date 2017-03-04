module SkedplusPairing::Crew
  attr_reader :members

  def initialize(members)
    @members = []
    members.each do |m|
      add_member(m)
    end
  end

  def <<(additional_members)
    additional_members.each do |m|
      add_member(m)
    end
  end

  def add_member(additional_member)
    @members << additional_member
  end

  def self.from_parser(parser)
  end
end
