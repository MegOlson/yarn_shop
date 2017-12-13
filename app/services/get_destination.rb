class Destination
  # include HTTPParty
  def self.get_destinations
    response = RestClient.get("http://localhost:3001/api/v1/destinations")
    JSON.parse(response)
    
  end

end
