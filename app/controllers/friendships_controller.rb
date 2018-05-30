class FriendshipsController < ApplicationController

	# before_action :check_user

	def destroy
		Friendship.find_by(id: params[:id]).destroy
		redirect_to "/friends"
	end

	def create
		byebug
		Friendship.create(user_id: current_user.id, friend_id: friendship_params[:friend_id])
		redirect_to "/friends"
	end

	private

	def friendship_params
		params.permit(:friend_id)
	end

end
