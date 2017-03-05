RSpec.describe SkedplusPairing::Crewmember do
  FakeParser = Struct.new(:name, :base, :equipment)
  let(:fake_parser) { FakeParser.new("Marc Kruza", "CHS", "CRJ") }
  let(:crewmember) { SkedplusPairing::Crewmember.new(fake_parser) }

  it "#name" do
    expect(crewmember.name).to eq "Marc Kruza"
  end

  it "#first_name" do
    expect(crewmember.first_name).to eq("Marc")
  end

  it "#last_name" do
    expect(crewmember.last_name).to eq("Kruza")
  end

  it "#base" do
    expect(crewmember.base).to be_a SkedplusPairing::Airport
    expect(crewmember.base.timezone).to eq "America/New_York"
  end

  it "#equipment" do
    expect(crewmember.equipment).to eq "CRJ"
  end
end