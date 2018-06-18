# defines a new GraphQL type
Types::UserType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'User'

  # it has the following fields
  field :id, !types.ID
  field :book, -> { !types[Types::BookType] }
  field :copy, -> { !types[Types::CopyType] }
  field :email, !types.String
  field :name, !types.String
end