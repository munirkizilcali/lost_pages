class UserSerializer < ActiveModel::Serializer
  attributes :id, :email
  # has_many :copies
  has_many :books, through: :copies
end
