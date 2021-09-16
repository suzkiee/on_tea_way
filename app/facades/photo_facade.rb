class PhotoFacade
  def self.get_photos(query) 
    photos = PhotoService.search_photos(query)
    photos[:results].map { |photo| PhotoDetails.new(photo) }
  end 
end