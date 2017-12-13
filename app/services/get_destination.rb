class Destination
  # include HTTPParty
  def self.get_destinations
    response = RestClient.get("http://localhost:3000/api/v1/destinations", headers= {Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MTMyNzg3ODd9.Xjv4TdqyRH4HIRkCYpaHjICpMsJbCujM_5qApbR9zYY"})
    JSON.parse(response)
  end

  def self.get_place(id)
    response = RestClient.get("http://localhost:3000/api/v1/destinations/#{id}", headers= {Authorization: "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE1MTMyNzg3ODd9.Xjv4TdqyRH4HIRkCYpaHjICpMsJbCujM_5qApbR9zYY"})
    JSON.parse(response)
  end

end
