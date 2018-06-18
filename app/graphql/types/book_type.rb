# defines a new GraphQL type
Types::BookType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'Book'

  # it has the following fields
  field :id, !types.ID
  field :name, !types.String
  field :short_description, !types.String
  field :cover_img, !types.String
  field :copies, -> { !types[Types::CopyType] }
end