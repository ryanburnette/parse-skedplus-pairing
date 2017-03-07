RSpec.describe SkedplusPairing::Airport do
  let(:atl) { SkedplusPairing::Airport.new("ATL") }

  it "#name" do
    expect(atl.name).to eq "Hartsfield Jackson Atlanta Intl"
  end

  it "#ident" do
    expect(atl.ident).to eq "ATL"
  end

  it "#timezone" do
    expect(atl.timezone).to eq "America/New_York"
  end
end
