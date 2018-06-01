class Copy < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :lendings
  validates :book_id, uniqueness: {scope: [:user_id], message: "You already have this book in your library"}

  def self.friend_copies_search(search, current_user)
    books = Book.friend_book_search(search, current_user)
  end

  def current_lending
    self.lendings.where("status = ?", "active").first
  end

  def open_requests
    self.lendings.where("status = ?", "requested")
  end

  def open_requests_names
    open_requests.map {|request| request.borrower.name}.join(", ")
  end

  def past_lendings
    self.lendings.where("status = ?", "returned")
  end

  def current_borrower
    if current_lending
      current_lending.borrower
    end
  end

  def available?
    !current_lending
  end

  def available_message
    self.available? ? "Available" : "Currently borrowed by #{self.current_borrower.name}. Return date: #{self.current_lending.formatted_due_date}"
  end

end
