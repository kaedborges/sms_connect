module V1
  module Users
    class UsersController < ApplicationController
      before_action :validate_user_token

      def show
        @current_user
        render :user, status: :ok
      end

      private

      def set_user; end
    end
  end
end

