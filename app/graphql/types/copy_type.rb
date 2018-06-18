# defines a new GraphQL type
Types::CopyType = GraphQL::ObjectType.define do
  # this type is named `Link`
  name 'Copy'

  # it has the following fields
  field :id, !types.ID
  field :book, -> { Types::BookType }
  field :user, -> { Types::UserType }
end