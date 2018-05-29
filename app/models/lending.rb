class Lending < ApplicationRecord
	belongs_to :copy
  has_one :user, through: :copy
	belongs_to :borrower, :class_name => "User"

  def formatted_due_date
    self.due_date.strftime("%B %d, %Y")
  end
end
