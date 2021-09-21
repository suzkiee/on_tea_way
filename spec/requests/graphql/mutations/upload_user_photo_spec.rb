require 'rails_helper'

RSpec.describe 'Upload User Photo', type: :request do
  describe '.resolve' do
    before(:each) do
      @user = create(:mock_user) 
      @image = Rack::Test::UploadedFile.new(file_fixture('green-blue-pink.jpeg'), "mime/type")
    end

    it 'happy path: uploads file and creates photo' do 
      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $image
                        userId: #{@user.id}}) {
                            userId
                            unsplashId
                            userUploaded
                            url
                          }
                        } 
                 GQL
      post '/graphql', params: { query: query, variables: { image: @image } }
      json = JSON.parse(response.body, symbolize_names: true)
      photo = json[:data][:uploadUserPhoto]

      expect(photo).to have_key(:userId) 
      expect(photo).to have_key(:unsplashId)
      expect(photo).to have_key(:userUploaded) 
      expect(photo).to have_key(:url) 
      
      expect(@user.photos.first.upload).to be_a(ActiveStorage::Attached::One)
      expect(photo[:userId].to_i).to eq(@user.id)
      expect(photo[:unsplashId]).to eq(nil)
      expect(photo[:userUploaded]).to eq(true)
      expect(photo[:url]).to eq(nil)
    end 

    it 'sad path: cannot upload photo without user id' do 
      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $image
                        userId: "#{}"}) {
                            userId
                            unsplashId
                            userUploaded
                          }
                        } 
                 GQL

      post '/graphql', params: { query: query, variables: { image: @image } }
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0][:message]
      
      expect(error).to eq("Argument 'userId' on InputObject 'UploadUserPhotoInput' has an invalid value (\"\"). Expected type 'Int!'.")
    end

    it 'sad path: cannot upload photo without image' do 
      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $image
                        userId: #{@user.id}}) {
                            userId
                            unsplashId
                            userUploaded
                          }
                        } 
                 GQL

      post '/graphql', params: { query: query }
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0][:message]
      
      expect(error).to eq("Variable $image of type Upload! was provided invalid value")
    end
  end
end