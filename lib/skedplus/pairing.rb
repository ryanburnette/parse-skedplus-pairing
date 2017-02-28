class Skedplus::Pairing
  attr_reader :contents

  def initialize(contents)
    @contents = contents
  end

  def self.new_from_file_path(file_path)
    new(File.open(file_path).read)
  end
end
