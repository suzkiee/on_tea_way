module Mutations 
  module Photos 
    class UploadUnsplashPhoto < Mutations::BaseMutation
      argument :user_id, Integer, required: true
      argument :url, String, required: true
      argument :unsplash_id, String, required: true

      type Types::PhotoType

      def resolve(attributes)
        attributes[:user_uploaded] = false 
        if Photo.find_by(unsplash_id: attributes[:unsplash_id]).nil? 
          photo = Photo.create!(attributes)
        else 
          photo = Photo.find_by(unsplash_id: attributes[:unsplash_id])
        end
        photo 
      end 
    end
  end
end 