class PhotoDetails
  attr_reader :url,
              :user_uploaded,
              :unsplash_id

  def initialize(photo_hash)
    @url = photo_hash[:urls][:regular]
    @user_uploaded = false 
    @unsplash_id = photo_hash[:id]
  end
end