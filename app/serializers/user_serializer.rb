class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :copies
end
