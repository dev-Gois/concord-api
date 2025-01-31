class UsersController < ApplicationController
  def register
    result = Users::Organizers::Register.call(user_params: user_params)
    if result.success?
      render json: UserSerializer.new(result.user).serializable_hash.to_json, status: :created
    else
      render json: { errors: result.message }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
