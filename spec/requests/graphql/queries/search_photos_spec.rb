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

  describe 'sad path' do
    it 'returns all photos that match query', :vcr do
      query = <<~GQL
                query {
                  searchPhotos(query: 0){
                       url
                       unsplashId
                      userUploaded
                  }
                }
                GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0]

      expect(error[:message]).to eq("Argument 'query' on Field 'searchPhotos' has an invalid value (0). Expected type 'String!'.")
      expect(error[:extensions][:code]).to eq("argumentLiteralsIncompatible")
    end 
  end
end