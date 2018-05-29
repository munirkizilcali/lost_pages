class Book < ApplicationRecord
	has_many :copies
	has_many :lendings, through: :copies
	has_many :owners, through: :copies
end
