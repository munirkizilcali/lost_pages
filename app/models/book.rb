class Book < ApplicationRecord
	has_many :copies
	has_many :lendings, through: :copies
	has_many :users, through: :copies
end
