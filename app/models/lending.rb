class Lending < ApplicationRecord
	belongs_to :copy
  has_one :user, through: :copies
	belongs_to :borrower, class_name: :user
end
