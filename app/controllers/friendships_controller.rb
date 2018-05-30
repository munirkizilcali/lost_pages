class FriendshipsController < ApplicationController

	# before_action :check_user

	def destroy
		Friendship.find_by(id: params[:id]).destroy
		redirect_to "/friends"
	end

	def create
		Friendship.create(friendship_params)
		redirect_to "/friends"
	end

	private

	def friendship_params
		params.permit(:friend_id, :user_id)
	end

end
