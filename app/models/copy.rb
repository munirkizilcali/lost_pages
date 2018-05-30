class Copy < ApplicationRecord
	belongs_to :user
	belongs_to :book
	has_many :lendings

  def current_lending
    Lending.where("returned = ? AND copy_id = ?", false, self.id)
  end

  def current_borrower
    current_lending.first.borrower.name
  end

  def available?
    self.current_lending.empty? ? true : false
  end

  def requests
    self.current_lending.select { |lending| !lending.lend_date? }
  end

end
