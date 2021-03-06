module Api
  module V1
    class Api::V1::RegistrationsController < Devise::RegistrationsController
    include DeviseHelper
    before_action :ensure_params_exist

    respond_to :json

    def create
      user = User.new user_params
      if user.save
        render json: {message: "Registration has been completed", user: user, status: 200}
      else
        warden.custom_failure!
        render json: {message: user.errors.messages}, status: 200
      end
    end

    private
      def user_params
        params.require(:user).permit :email, :password, :password_confirmation
      end
    end
  end
end