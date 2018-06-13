class CopySerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :book
  belongs_to :user
end
