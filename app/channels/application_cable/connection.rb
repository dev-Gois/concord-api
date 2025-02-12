module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = authenticate_user_in_channel!
      reject_unauthorized_connection unless current_user
    end

    private

    def authenticate_user_in_channel!
      return nil if request.params[:token].blank?

      result = Users::Interactors::Authorization::DecodeToken.call(jwt_token: request.params[:token])

      result.success? ? result.user : nil
    end
  end
end