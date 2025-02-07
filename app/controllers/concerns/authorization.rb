module Authorization
  extend ActiveSupport::Concern

  included do
    before_action :authenticate_user!
  end

  def authenticate_user!
    render_unauthorized unless current_user
  end

  def current_user
    return false if request.headers["Authorization"].blank?

    result = Users::Interactors::Authorization::DecodeToken.call(jwt_token: token)

    if result.success?
      @current_user = result.user
    else
      false
    end
  end

  def token
    request.headers["Authorization"].split(" ").last
  end

  def render_unauthorized
    render json: { error: "Unauthorized" }, status: :unauthorized
  end
end
