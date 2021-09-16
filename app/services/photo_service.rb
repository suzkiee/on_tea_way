class PhotoService

  def self.search_photos(query)
    new.request_api(query)
  end

  def request_api(query)
    response = connection.get("/search/photos") do |request| 
      request.headers['Accept-Version'] = 'v1'
      request.params['client_id'] = ENV['UNSPLASH_KEY']
      request.params['query'] = query
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def connection
    Faraday.new(url: "https://api.unsplash.com/")
  end 
end