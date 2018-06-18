module Api
  module V1
    class UsersController < ApplicationController
 
      def index
        render json: User.all.includes(:copies)
      end
 
    end
  end
end