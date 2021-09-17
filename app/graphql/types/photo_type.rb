module Types
  class PhotoType < Types::BaseObject
    include Rails.application.routes.url_helpers

    field :id, ID, null: false
    field :url, String, null: true
    field :unsplash_id, String, null: true
    field :user_uploaded, Boolean, null: true
    field :user_photo_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
