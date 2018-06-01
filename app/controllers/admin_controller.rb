class AdminController < ApplicationController
  
  before_action :admin_check

  def index
  	@user_count = User.count 
  	@book_count = Book.count 
  	@copy_count = Copy.count 
  	@lending_count = Lending.count
  	@active_lending_count = Lending.where(status: "active").count 
  	@average_library_size = @copy_count/@user_count
  	@worst_rated_user = User.all.sort_by{|user| user.average_rating }.first
  	@best_rated_user = User.all.sort_by{|user| user.average_rating }.last
  end

  private

  def admin_check
  	if current_user.email != "fionna@fionna.com"
  		head(:forbidden)
  	end
  end
end
