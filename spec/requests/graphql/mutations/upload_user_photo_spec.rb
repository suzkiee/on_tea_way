require 'rails_helper'

RSpec.describe 'Upload User Photo', type: :request do
  describe '.resolve' do
    # Running into issue passing file in the query. Upload works on Altair. 
    it 'happy path: uploads file and creates photo' do 
      user = create(:mock_user) 
      image = Rack::Test::UploadedFile.new(file_fixture('green-blue-pink.jpeg'), "mime/type")
      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $image
                        userId: #{user.id}}) {
                            userId
                            unsplashId
                            userUploaded
                            url
                          }
                        } 
                 GQL
      post '/graphql', params: { query: query, variables: { image: image } }
      json = JSON.parse(response.body, symbolize_names: true)
      photo = json[:data][:uploadUserPhoto]

      expect(photo).to have_key(:userId) 
      expect(photo).to have_key(:unsplashId)
      expect(photo).to have_key(:userUploaded) 
      expect(photo).to have_key(:url) 
      
      expect(user.photos.first.upload).to be_a(ActiveStorage::Attached::One)
      expect(photo[:userId].to_i).to eq(user.id)
      expect(photo[:unsplashId]).to eq(nil)
      expect(photo[:userUploaded]).to eq(true)
      expect(photo[:url]).to eq(nil)
    end 

    xit 'sad path: uploads file and creates photo' do 
      user = create(:mock_user) 
      upload = File.absolute_path("green-blue-pink.jpeg")

      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $#{upload}
                        userId: #{user.id}}) {
                            userId
                            unsplashId
                            userUploaded
                          }
                        } 
                 GQL
      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
    end 
  end
end