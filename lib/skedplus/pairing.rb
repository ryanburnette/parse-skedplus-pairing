class Skedplus::Pairing
  def initialize(contents)
  end

  def self.new_from_file_path(file_path)
    new(File.open(file_path).read)
  end
end
