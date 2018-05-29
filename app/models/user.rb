class User < ApplicationRecord
	has_many :copies
	has_many :books, through: :copies
	has_many :lendings, through: :copies
	has_many :borrowings, :foreign_key => 'borrower_id', :class_name => "Lending"
end
