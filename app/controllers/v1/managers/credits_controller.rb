module V1
  module Managers
    class CreditsController < ApplicationController
      before_action :set_user, only: %i[user_credits user_add user_remove]

      def global
        @balance = JSON.parse(SendSmsBackboneServices.new.credit)['balance']
        render :balance, status: :ok
      end

      def user_credit
        render :user_not_found, status: :not_found and return if @user.nil?

        @user_balace = UserCredit.find_by(user: @user)
        pp @user_balace
        render :user_balance, status: :ok
      end

      def user_credits
        render :user_not_found, status: :not_found and return if @user.nil?

        @user_balaces = CreditsHistory.where(user_id: @user.id)
        render :user_balances, status: :ok
      end

      def user_add
        render :user_not_found, status: :not_found and return if @user.nil?
        @creditUser = UserCredit.find_by(user: @user)

        if @creditUser.nil?
          UserCredit.create(user: @user, balace: params[:balance], operation: 'ADD')
          uc = UserCredit.new
          uc.user_id = @user.id
          uc.balace = params[:balance]
          uc.operation = 'ADD'
          uc.save

          ch = CreditsHistory.new
          ch.user_id = @user.id
          ch.balance = params[:balance]
          ch.operation = 'ADD'
          ch.save
        else
          balance = params[:balance].to_i + @creditUser.balace
          puts balance
          UserCredit.update(@creditUser.id, balace: balance)
          ch = CreditsHistory.new
          ch.user_id = @user.id
          ch.balance = params[:balance]
          ch.operation = 'ADD'
          ch.save
        end
      end

      def user_remove
        render :user_not_found, status: :not_found and return if @user.nil?
        @creditUser = UserCredit.find_by(user: @user)
        render :user_not_found, status: :not_found and return if @creditUser.balace == 0

        balance = @creditUser.balace - params[:balance].to_i
        UserCredit.update(@creditUser.id, balace: balance)

        ch = CreditsHistory.new
        ch.user_id = @user.id
        ch.balance = params[:balance]
        ch.operation = 'REMOVE'
        ch.save

        head :no_content
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

    end
  end
end
