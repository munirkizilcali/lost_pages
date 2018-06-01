require 'test_helper'

class LendingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not create a duplicate lending request " do
  	lending1 =  Lending.new(copy_id: 2, borrower_id: 1, status: "requested")
  	assert_not lending1.save, "Saved the duplicate lending request."
  end
end
