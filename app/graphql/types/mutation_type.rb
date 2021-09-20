module Types
  class MutationType < Types::BaseObject

    field :upload_user_photo, mutation: Mutations::Photos::UploadUserPhoto,
    description: 'Add a user-uploaded photo'

    field :upload_unsplash_photo, mutation: Mutations::Photos::UploadUnsplashPhoto, description: 
    'Add Unsplash photo'
  end
end
