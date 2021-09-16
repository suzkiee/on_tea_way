module Types
  class PackagePhotoType < Types::BaseObject
    field :id, ID, null: false
    field :subscription_id, Integer, null: true
    field :photo_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
