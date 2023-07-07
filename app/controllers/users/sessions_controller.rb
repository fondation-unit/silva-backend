# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    # Resent the user confirmation email if not confirmed
    user = User.find_by(email: params[:user][:email])
    user.send_confirmation_instructions unless user.nil? || user.confirmed?
    # Default behaviour
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  end

  private

    def respond_with(resource, _opts = {})
      render json: {
        status: { code: 200, message: "Logged in sucessfully." },
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user
        render json: {
          status: { code: 200, message: "Logged out successfully" }
        }, status: :ok
      else
        render json: {
          status: { code: 401, message: "Couldn't find an active session." }
        }, status: :unauthorized
      end
    end

    def user_params
      require(:user).permit(:email, :password)
    end
end
