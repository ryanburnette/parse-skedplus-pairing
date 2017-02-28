require "date"

module RbSkedplus
  class Pairing
    attr_reader :contents

    DIVIDER = "________________________________________________________________________________"

    def initialize(contents, options={})
      @contents = contents
    end

    def lines
      contents.split("\r\n")
    end

    def header
      contents.split(DIVIDER).first
    end

    def header_parts
      header.split(" ")
    end

    def footer
      contents.split(DIVIDER).last
    end

    def days
      a = contents.split(DIVIDER)
      a.shift
      a.pop
      return a
    end

    def crewmember_number
      header_parts[0]
    end

    def crewmember_first_name
      header_parts[1]
    end

    def crewmember_last_name
      header_parts[2]
    end

    def crewmember_name
      [crewmember_first_name, crewmember_last_name].join(" ")
    end

    def crewmember_base
      header_parts[3]
    end

    def crewmember_aircraft
      header_parts[4]
    end

    def crewmember_position
      header_parts[5]
    end

    def id
      header_parts[6]
    end

    def date
      Date.strptime(header_parts[7], "%m/%d/%Y")
    end

    def block_time
      header_parts[9]
    end

    def credit_time
      header_parts[11]
    end

    def tafb_time
      header_parts[13]
    end

    def self.new_from_file_path(file_path)
      new(File.open(file_path).read)
    end
  end
end
