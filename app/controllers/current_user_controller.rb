# frozen_string_literal: true

class CurrentUserController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end

  def update
    if current_user&.update(user_params)
      return render json: {
        status: { code: 200, message: "Profile updated successfully." },
        data: UserSerializer.new(current_user).serializable_hash[:data][:attributes]
      }
    end

    return render json: { error: "Unprocessable entity" }, status: :unprocessable_entity unless current_user&.admin?
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :lastname)
    end
end
