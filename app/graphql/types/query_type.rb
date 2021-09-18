module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :search_photos, [Types::PhotoType], null: false, description: 'Returns photos that match a search term' do
      argument :query, String, required: true
    end

    def search_photos(query:)
      PhotoFacade.get_photos(query)
    end

    field :user_photos, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    
    def user_photos(id:)
      user = User.find(id)
    end
  end
end
