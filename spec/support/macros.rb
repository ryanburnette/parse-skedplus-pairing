module Macros
  def file_contents(path)
    File.open(file_path).read
  end
end
