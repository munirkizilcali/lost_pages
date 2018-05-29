class FriendshipsController < ApplicationController

	# before_action :check_user

	def destroy
		Friendship.find_by(id: params[:id]).destroy
		redirect_to "/friends"
	end

end
