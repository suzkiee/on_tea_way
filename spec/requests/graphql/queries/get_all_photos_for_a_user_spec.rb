require 'rails_helper'

RSpec.describe 'Users Photos', type: :request do
  describe 'happy path' do
    it 'returns all photos of given user' do
      user = create(:mock_user)
      photos = create_list(:mock_photo, 5, user: user)
      query = <<~GQL
                  query {
                    userPhotos(id: #{user.id}){
                      id
                      photos {
                        id
                        userUploaded
                        unsplashId
                        userPhotoUrl
                      }
                    }
                  }   
                GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      photos = json[:data][:userPhotos][:photos]
      
      user_photo = user.photos.first  
      response_photo = photos.first
      
      expect(photos).to be_a(Array)
      expect(photos.count).to eq(5)
      expect(response_photo[:id].to_i).to eq(user_photo.id)
      expect(response_photo[:userUploaded]).to eq(user_photo.user_uploaded)
      expect(response_photo[:unsplashId]).to eq(user_photo.unsplash_id)
      expect(response_photo[:userPhotoUrl]).to eq(user_photo.user_photo_url)
    end
  end
end 