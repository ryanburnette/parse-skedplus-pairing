require "rb_skedplus/txt"
require "rb_skedplus/line"
require "rb_skedplus/divider"

RSpec.describe RbSkedplus::Line do
  before :all do
    file_path = "spec/data/7050924_20161225_F404PC.txt"
    @file_contents = File.open(file_path).read
    @pairing = RbSkedplus::Txt.new(@file_contents)
    @lines = @pairing.lines.collect { |l| RbSkedplus::Line.new(l) }
  end

  it "has contents" do
    expect(@lines[0].contents).to eq(@file_contents.split("\r\n")[0])
    expect(@lines[1].contents).to eq(@file_contents.split("\r\n")[1])
  end

  context "detects" do
    it "a divider" do
      expect(@lines[2].is_divider?).to be_truthy
      expect(@lines[2].detect).to eq(RbSkedplus::Divider)
    end
  end
end
