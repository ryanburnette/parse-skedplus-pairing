require "pikelet"

module RbSkedplus::Parser::Flight
  def self.definition
    Pikelet.define do
      sequence 0...2
      number   4...8
      tail    12...18
      org     20...23
      dest    25...28
      dep     30...35
      arr     37...42
      pax     44...47
      block   48...53
      credit  55...60
      dpu     62...65 
      dhd     67...68
      turn    71...75
    end
  end

  def self.parse(contents)
    self.definition.parse([contents])[0]
  end
end
