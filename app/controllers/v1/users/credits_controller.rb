module V1
  module Users
    class CreditsController < ApplicationController
      before_action :validate_user_token

      def show_balance
        @credit = UserCredit.find_by(user: @current_user)
        render :credit, status: :ok
      end

      def show_transatio
        @credits = CreditsHistory.where(user:@current_user)
        render :credits, status: :ok
      end

    end
  end
end

