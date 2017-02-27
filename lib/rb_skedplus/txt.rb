module RbSkedplus
  class Txt
    attr_reader :contents

    def initialize(contents, options={})
      @contents = contents
    end

    def lines
      contents.split("\r\n")
    end

    def self.new_from_file_path(file_path)
      new(File.open(file_path).read)
    end
  end
end
