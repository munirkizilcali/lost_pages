class User < ApplicationRecord
	has_many :copies
	has_many :books, through: :copies
	has_many :lendings, through: :copies
	has_many :borrowings, :foreign_key => 'borrower_id', :class_name => "Lending"
  	has_many :friendships
  	has_many :friends, through: :friendships

  	has_secure_password
  	
end
