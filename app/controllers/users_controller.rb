class UsersController < ApplicationController

  before_action :user_check, only:[:friends]

  def index
    @users = User.all
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  		if @user.valid?
  			@user.save
  			session[:user_id] = @user.id
  			redirect_to root_path
  		else
  			render :new
  		end
  end

  # def add_friend
  #   current_user.add_friend(User.find_by(id: params[:id]))
  #   redirect_to "/friends"
  # end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
