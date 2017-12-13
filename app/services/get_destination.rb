class Destination
  # include HTTPParty
  def self.get_destinations
    response = RestClient.get("http://localhost:3000/api/v1/destinations", headers= {Authorization: ENV['TRAVEL_API_KEY']})
    JSON.parse(response)
  end

  def self.get_place(id)
    response = RestClient.get("http://localhost:3000/api/v1/destinations/#{id}", headers= {Authorization: ENV['TRAVEL_API_KEY']})
    JSON.parse(response)
  end

end
