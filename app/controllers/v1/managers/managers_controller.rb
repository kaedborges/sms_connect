module V1
  module Managers
    class ManagersController < ApplicationController
      before_action :random_password, only: :new

      def index
        @managers = Manager.all
        render :list_managers, status: :ok
      end

      def new
        @manager = Manager.new(manager_params)
        @manager.encrypted_password = @password

        render :bad_request, status: :bad_request and return unless @manager.active!

        SendNotificationSmsJob.perform_later(@manager, @password)
        render :new_manager, status: :created
      end

      private

      def manager_params
        params.permit(:nome, :email, :cellphone)
      end
    end
  end
end
