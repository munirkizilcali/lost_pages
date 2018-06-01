class Lending < ApplicationRecord
	belongs_to :copy
  has_one :user, through: :copy
	belongs_to :borrower, :class_name => "User"
  validate :no_double_requests

  def formatted_due_date
    if self.due_date
      self.due_date.strftime("%b %d, %y")
    end
  end

  def formatted_lend_date
    if self.lend_date
      self.lend_date.strftime("%b %d, %y")
    end
  end


  def no_double_requests
    result = true
    self.borrower.requested_borrowings.each do |borrowing|
      if borrowing.copy == self.copy && borrowing.status == "requested" && self.id != borrowing.id
        result = false
        errors.add(:borrower_id, "You already requested that book.")
      end
    end
    result
  end



end
