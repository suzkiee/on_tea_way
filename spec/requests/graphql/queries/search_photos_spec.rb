require 'rails_helper'

RSpec.describe 'Search Unsplash Photo', type: :request do
  describe 'happy path' do
    it 'returns all photos that match query', :vcr do
      query = <<~GQL
                query {
                  searchPhotos(query: "puppy"){
                       url
                       unsplashId
                      userUploaded
                  }
                }
                GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      photos = json[:data][:searchPhotos]
      photo = photos.first
   
      expect(photos).to be_a(Array)
      expect(photos.count).to eq(10)

      expect(photo).to have_key(:url)
      expect(photo).to have_key(:unsplashId)
      expect(photo).to have_key(:userUploaded)
      
      expect(photo[:userUploaded]).to eq(false)
    end
  end
end