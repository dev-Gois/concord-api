module Users
  module Organizers
    class Login
      include Interactor::Organizer

      organize(
        Users::Interactors::Find,
        Users::Interactors::Authenticate,
        Users::Interactors::Authorization::EncodeToken
      )
    end
  end
end
