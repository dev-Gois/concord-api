class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[register login]

  def register
    result = Users::Organizers::Register.call(user_params: register_params)
    if result.success?
      render json: UserWithTokenSerializer.new(
        Wrappers::UserWithToken.new(result.user, result.jwt_token)
      ).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  def login
    result = Users::Organizers::Login.call(user_params: login_params)
    if result.success?
      render json: UserWithTokenSerializer.new(
        Wrappers::UserWithToken.new(result.user, result.jwt_token)
      ).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  def all
    users = User.all
    render json: UserSerializer.new(users).serializable_hash.to_json, status: :ok
  end

  private

  def register_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
