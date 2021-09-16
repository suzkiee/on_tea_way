module Types
  class SubscriptionType < Types::BaseObject
    field :id, ID, null: false
    field :customer_id, Integer, null: true
    field :tea_id, Integer, null: true
    field :title, String, null: true
    field :price, Float, null: true
    field :status, String, null: true
    field :frequency, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
