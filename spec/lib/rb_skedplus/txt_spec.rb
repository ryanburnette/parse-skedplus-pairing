require "rb_skedplus/txt"

RSpec.describe RbSkedplus::Txt do
  before :all do
    file_path = "spec/data/7050924_20161225_F404PC.txt"
    @file_contents = File.open(file_path).read
    @pairing = RbSkedplus::Txt.new(@file_contents)
    @pairing_from_file_contents = @pairing
    @pairing_from_file_path = RbSkedplus::Txt.new_from_file_path(file_path)
  end

  context "instantiates" do
    it "from file contents" do
      expect(@pairing_from_file_contents.contents).to eq(@file_contents)
    end

    it "from a file path" do
      expect(@pairing_from_file_path.contents).to eq(@file_contents)
    end
  end

  it "returns the lines" do
    expect(@pairing.lines).to eq(@file_contents.split("\r\n"))
  end
end
