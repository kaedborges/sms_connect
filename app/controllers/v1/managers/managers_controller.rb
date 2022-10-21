module V1
  module Managers
    class ManagersController < ApplicationController
      before_action :random_password, only: :new
      before_action :validate_manager_token
      before_action :set_manager, only: %i[destroy new reset_manager_password]

      def index
        @managers = Manager.all#.where({status: 1})
        render :list_managers, status: :ok
      end

      def new
        @manager = Manager.new(manager_params)
        @manager.password = @password
        @manager.password_confirmation = @password

        render :bad_request, status: :bad_request and return unless @manager.active!

        SendNotificationSmsJob.perform_later(@manager, @password)
        render :new_manager, status: :created
      end

      def reset_manager_password
        render :bad_request, status: :bad_request and return if @current_manager == @manager
        @manager.password = @password
        @manager.password_confirmation = @password

        render :bad_request, status: :bad_request and return unless @manager.update
        SendNotificationSmsJob.perform_later(@manager, @password)
        head :no_content
      end

      def show
        @manager = Manager.find(params[:id])
        render :list_manager, status: :ok
      end

      def destroy
        @manager = Manager.find(params[:id])
        pp @manager
        if @manager.nil?
          render :not_found, status: :not_found
        else
          @manager.destroy
          head :no_content
        end


        # Manager.destroy(@manager)
      end

      private

      def manager_params
        params.permit(:name, :email, :cellphone)
      end
      def set_manager
        @manager = Manager.find(params[:id])
      end
    end
  end
end
