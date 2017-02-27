require "date"

module RbSkedplus
  class Pairing
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

    def crewmember_number
      lines[0].split(" ")[0]
    end

    def crewmember_first_name
      lines[0].split(" ")[1]
    end

    def crewmember_last_name
      lines[0].split(" ")[2]
    end

    def crewmember_name
      [crewmember_first_name, crewmember_last_name].join(" ")
    end

    def crewmember_base
      lines[0].split(" ")[3]
    end

    def crewmember_aircraft
      lines[0].split(" ")[4]
    end

    def crewmember_position
      lines[0].split(" ")[5]
    end

    def id
      lines[0].split(" ")[6]
    end

    def date
      Date.strptime(lines[0].split(" ")[7], "%m/%d/%Y")
    end

    def block_time
      lines[1].split(" ")[1]
    end

    def credit_time
      lines[1].split(" ")[3]
    end

    def tafb_time
      lines[1].split(" ")[5]
    end
  end
end
