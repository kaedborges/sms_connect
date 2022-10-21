module V1
  module Users
    class UsersController < ApplicationController
      before_action :validate_user_token

      def show
        @current_user
        render :user, status: :ok
      end

      def update
        @user = @current_user

        render :bad_request, status: :bad_request and return unless @user.update(product_params)

        render :user, status: :ok
      end

      private
      def product_params
        params.require(:user).permit(:email, :name)
      end
      def set_user; end
    end
  end
end

