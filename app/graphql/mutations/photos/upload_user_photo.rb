module Mutations 
  module Photos 
    class UploadUserPhoto < Mutations::BaseMutation
      argument :upload, ApolloUploadServer::Upload, required: false
      argument :user_id, Integer, required: true
      argument :unsplash_id, String, required: false
      argument :user_uploaded, Boolean, required: false
      argument :url, String, required: false

      type Types::PhotoType

      def resolve(attributes)
        file = attributes[:upload]
        blob = ActiveStorage::Blob.create_after_upload!(
          io: file,
          filename: file.original_filename,
          content_type: file.content_type
        )

        photo = Photo.create!(
          user_id: attributes[:user_id],
          url: attributes[:url],
          user_photo_url: attributes[:url],
          user_uploaded: true,
          upload: blob
        )
        photo
      end
    end
  end
end