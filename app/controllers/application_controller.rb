# frozen_string_literal: true

class ApplicationController < ActionController::API
  def ensure_admin!
    render json: { error: "Unauthorized" }, status: :unauthorized unless current_user&.admin?
  end
end
