class Copy < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :lendings

  def self.friend_copies_search(search, current_user)
    books = Book.friend_book_search(search, current_user)
    book_ids = books.map {|book| book.id }
    copies = current_user.friend_copies.where(book_id: book_ids)
    friend_book_copy_hash(books, copies)
  end

  def self.friend_book_copy_hash(books, copies)
    book_copy_hash = {}
    books.each {|book| book_copy_hash[book] = []}
    copies.each {|copy| book_copy_hash[copy.book] << copy}
    book_copy_hash
  end

  def current_lending
    self.lendings.where("status = ?", "active").first
  end

  def open_requests
    self.lendings.where("status = ?", "requested")
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


end
