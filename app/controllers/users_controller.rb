class UsersController < ApplicationController
  def register
    result = Users::Organizers::Register.call(user_params: register_params)
    if result.success?
      render json: UserSerializer.new(result.user).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  def login
    result = Users::Organizers::Login.call(user_params: login_params)
    if result.success?
      render json: UserSerializer.new(result.user).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  private

  def register_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def login_params
    params.require(:user).permit(:email, :password)
  end
end
