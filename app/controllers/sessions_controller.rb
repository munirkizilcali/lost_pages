class SessionsController < ApplicationController


	def create

		if auth #if login with omniauth-facebook
		    @user = User.find_or_create_by(uid: auth['uid']) do |u|
		      u.name = auth['info']['name']
		      u.email = auth['info']['email']
		      u.image = auth['info']['image']
		      u.password_digest = "0"
		    end
		    session[:user_id] = @user.id
		    redirect_to root_path

		else # if login with password

			@user = User.find_by(email: params[:email])
			if @user
				return head(:forbidden) unless @user.authenticate(params[:password])
				session["user_id"] = @user.id
				redirect_to root_path
			else
				flash[:message] = "Username or password did not match"
				render :new
			end
		end
	end

	def destroy
		session.delete :user_id
		redirect_to root_path
	end

	private 

	def auth
    	request.env['omniauth.auth']
  	end

end
