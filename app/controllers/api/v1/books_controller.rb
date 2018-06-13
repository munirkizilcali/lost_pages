module Api
  module V1
    class BooksController < ApplicationController
 
      def index
        render json: Book.all.includes(:copies)
      end
 
    end
  end
end