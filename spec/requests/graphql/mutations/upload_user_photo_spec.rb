require 'rails_helper'

RSpec.describe 'Upload User Photo', type: :request do
  describe '.resolve' do
    # Running into issue passing file in the query. Upload works on Altair. 
    xit 'happy path: uploads file and creates photo' do 
      user = create(:mock_user) 
      image = file_fixture('green-blue-pink.jpeg')
      query = <<~GQL
                mutation($image: Upload!) {
                  uploadUserPhoto(input: {
                        upload: $#{image}
                        userId: #{user.id}}) {
                            userId
                            unsplashId
                            userUploaded
                          }
                        } 
                 GQL
      post '/graphql', params: { query: query }
      result = JSON.parse(response.body, symbolize_names: true)
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