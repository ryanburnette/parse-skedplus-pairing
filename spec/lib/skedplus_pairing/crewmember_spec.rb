RSpec.describe SkedplusPairing::Crewmember do
  FakeParser = Struct.new(:name, :base, :equipment)
  let(:fake_parser) { FakeParser.new(Faker::Name.name, Faker::Address.city, Faker::Commerce.product_name) }

  it "#name"
    expect(crewmember.name).to be_a String
  end

  it "#base"
    expect(crewmember.base).to be_a String
  end

  it "#equipment"
    expect(crewmember.base).to be_a String
  end

end
