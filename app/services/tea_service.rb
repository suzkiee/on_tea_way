class TeaService

  def self.find_tea(query)
    new.request_api(query)
  end

  def request_api(query)
    response = connection.get("/tea/#{query}") 
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://tea-api-vic-lo.herokuapp.com/")
  end 
end