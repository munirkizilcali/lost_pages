class BookSerializer < ActiveModel::Serializer
  attributes :name, :isbn, :author, :short_description, :cover_img
  has_many :copies
  has_many :users, through: :copies
end
