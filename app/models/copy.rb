class Copy < ApplicationRecord
	belongs_to :owner, :class_name => "User"
	belongs_to :book
	has_many :lendings
end
