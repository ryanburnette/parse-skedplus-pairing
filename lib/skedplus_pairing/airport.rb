require "net/http"
require "json"
require "retriable"
 
class SkedplusPairing::Airport
  def initialize(ident)
    Retriable.retriable do
      uri = URI("http://airports.api.faralmanac.com/iata/#{ident.downcase}.json")
      response = Net::HTTP.get(uri)
      @airport = JSON.parse(response)
    end
  end

  def ident
    @airport["iata"]
  end

  def name
    @airport["airport_name"]
  end

  def timezone
    @airport["timezone"]
  end
end
