class ApplicationController < ActionController::API
  rescue_from NoMethodError, with: :missing_user

  def missing_user
    render json: { errors: 'recipient or sender not found' }, status: :not_found
  end
end
