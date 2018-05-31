class SessionsController < ApplicationController


	def create
		@user = User.find_by(email: params[:email])
		if @user
			return head(:forbidden) unless @user.authenticate(params[:password])
			session["user_id"] = @user.id
			redirect_to library_path
		else
			flash[:message] = "Username or password did not match"
			render :new
		end
	end

	def destroy
		session.delete :user_id
		redirect_to home_path
	end

end
