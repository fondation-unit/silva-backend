# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

=begin
  def create
    puts "*" * 50
    puts params
    user = User.find_by(email: params[:email])
    puts user.inspect
    render json: {
      status: 401,
      message: "Couldn't find any user."
    }, status: :unauthorized unless user

    if 
    puts "*" * 50
  end
=end

  private

    def respond_with(resource, _opts = {})
      render json: {
        status: {code: 200, message: 'Logged in sucessfully.'},
        data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
      }, status: :ok
    end

    def respond_to_on_destroy
      if current_user
        render json: {
          status: 200,
          message: "logged out successfully"
        }, status: :ok
      else
        render json: {
          status: 401,
          message: "Couldn't find an active session."
        }, status: :unauthorized
      end
    end

    def user_params
      require(:user).permit(:email, :password)
    end
end
