require_relative "divider"

module RbSkedplus
  class Line
    attr_reader :contents

    def initialize(contents)
      @contents = contents
    end

    def detect
      RbSkedplus::Divider if is_divider?
    end

    def is_divider?
      contents.include?("__________________")
    end
  end
end
