module Users
  module Interactors
    class ValidateParams
      include Interactor

      delegate :user_params, to: :context

      def call
        raise "Todos os campos são obrigatórios!" if user_params[:name].blank? || user_params[:email].blank? || user_params[:password].blank? || user_params[:password_confirmation].blank?
        raise "Nome de usuário já cadastrado!" if User.exists?(name: user_params[:name])
        raise "E-mail já cadastrado!" if User.exists?(email: user_params[:email])
        raise "As senhas não coincidem!" if user_params[:password] != user_params[:password_confirmation]
      rescue StandardError => e
        context.fail!(message: e.message)
      end
    end
  end
end
