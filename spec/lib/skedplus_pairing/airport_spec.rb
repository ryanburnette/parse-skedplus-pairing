RSpec.describe SkedplusPairing::Airport do
  let(:atl) { SkedplusPairing::Airport.new("ATL") }

  it "instantiates" do
    expect(atl).to be_a SkedplusPairing::Airport
  end

  it "#name" do
    expect(atl.name).to eq "Hartsfield Jackson Atlanta Intl"
  end

  it "#timezone" do
    expect(atl.timezone).to eq "America/New_York"
  end
end
