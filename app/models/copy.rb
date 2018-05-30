class Copy < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :lendings

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
