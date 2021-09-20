require 'rails_helper'

RSpec.describe 'Upload User Photo', type: :request do
  describe '.resolve' do
    before(:each) do 
      @user = create(:mock_user)
      @url = "https://images.unsplash.com/photo-1593134257782-e89567b7718a?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNTEwMzZ8MHwxfHNlYXJjaHwxfHxwdXBweXxlbnwwfHx8fDE2MzIxNDM2MzY&ixlib=rb-1.2.1&q=80&w=1080"
      @unsplash_id = "sVtcRzphxbk" 
    end 

    it 'happy path: creates Photo from Unsplash photo' do
      query = <<~GQL 
                  mutation {
                    uploadUnsplashPhoto(input: 
                        { url: "#{@url}"
                          unsplashId: "#{@unsplash_id}"
                          userId: #{@user.id} 
                        }) {
                              userId
                              unsplashId
                              userUploaded
                              url 
                            }
                          }
                  GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      photo = json[:data][:uploadUnsplashPhoto]
      
      expect(photo).to have_key(:userId) 
      expect(photo).to have_key(:unsplashId)
      expect(photo).to have_key(:userUploaded) 
      expect(photo).to have_key(:url) 
                          
      expect(photo[:userId].to_i).to eq(@user.id)
      expect(photo[:unsplashId]).to eq(@unsplash_id)
      expect(photo[:userUploaded]).to eq(false)
      expect(photo[:url]).to eq(@url)
    end

    it 'sad path: cannot create Photo without User id' do
      query = <<~GQL 
                  mutation {
                    uploadUnsplashPhoto(input: 
                        { url: "#{@url}"
                          unsplashId: "#{@unsplash_id}"
                          userId: "#{}" 
                        }) {
                              userId
                              unsplashId
                              userUploaded
                              url 
                            }
                          }
                  GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0][:message]

      expect(error).to eq("Argument 'userId' on InputObject 'UploadUnsplashPhotoInput' has an invalid value (\"\"). Expected type 'Int!'.")
    end

    it 'sad path: cannot create Photo without Unsplash id' do
      query = <<~GQL 
                  mutation {
                    uploadUnsplashPhoto(input: 
                        { url: "#{@url}"
                          userId: #{@user.id} 
                        }) {
                              userId
                              unsplashId
                              userUploaded
                              url 
                            }
                          }
                  GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0][:message]
      
      expect(error).to eq("Argument 'unsplashId' on InputObject 'UploadUnsplashPhotoInput' is required. Expected type String!")
    end
    
    it 'sad path: cannot create Photo without Unsplash id' do
      query = <<~GQL 
                  mutation {
                    uploadUnsplashPhoto(input: 
                        { unsplashId: "#{@unsplash_id}"
                          userId: #{@user.id} 
                        }) {
                              userId
                              unsplashId
                              userUploaded
                              url 
                            }
                          }
                  GQL

      post '/graphql', params: { query: query}
      json = JSON.parse(response.body, symbolize_names: true)
      error = json[:errors][0][:message]
      
      expect(error).to eq("Argument 'url' on InputObject 'UploadUnsplashPhotoInput' is required. Expected type String!")
    end
  end
end 