class User < ApplicationRecord
	has_many :copies
	has_many :books, through: :copies
	has_many :lendings, through: :copies
	has_many :borrowings, :foreign_key => 'borrower_id', :class_name => "Lending"
  has_many :friendships
  has_many :friends, through: :friendships

  has_secure_password

  	def add_friend(user)
  		self.friends << user
  	end

    def friend_ids
      self.friends.map { |friend| friend.id  }
    end

    def friend?(user)
      self.friends.include?(user)
    end

    def friend_copies
      Copy.where(user_id: friend_ids)
    end

    def friend_books
      friend_copies.map {|copy| copy.book}
    end

    def active_borrowings
      self.borrowings.where(status: "active")
    end

    def requested_borrowings
      self.borrowings.where(status: "requested")
    end

end
