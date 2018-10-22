module Api::V1::DeviseHelper

	def ensure_params_exist
     return unless params[:user].blank?
      render json: {message: "Missing params"}, status: 422
    end
end
