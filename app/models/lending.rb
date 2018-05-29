class Lending < ApplicationRecord
	belongs_to :copy
	belongs_to :borrower, class_name: :user
end
