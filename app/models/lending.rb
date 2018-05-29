class Lending < ApplicationRecord
	belongs_to :copy
  has_one :user, through: :copy
	belongs_to :borrower, :class_name => "User"
end
