module V1
  module Managers
    class SessionsController < ApplicationController
      before_action :set_manager, only: %i[new]

      def new
        render :invalid_credentials, status: :unauthorized and return if @manager.nil?

      end

      def set_manager
        @manager = Manager.find(email: params[:email])
      end

    end
  end
end
